/* Copyright lowRISC contributors. */
/* Licensed under the Apache License, Version 2.0, see LICENSE for details. */
/* SPDX-License-Identifier: Apache-2.0 */

/**
 * Linker script for an OpenTitan Mask ROM.
 *
 * Portions of this file are Ibex-specific.
 */

OUTPUT_ARCH(riscv)
GROUP(-lgcc)

/**
 * Indicate that there are no dynamic libraries, whatsoever.
 */
__DYNAMIC = 0;

INCLUDE hw/top_earlgrey/sw/autogen/top_earlgrey_memory.ld

/**
 * The boot address, which indicates the location of the initial interrupt
 * vector.
 */
_mask_rom_boot_address = ORIGIN(rom);

/* Reserving 32 bytes at the top of the RAM for test utils. */
_test_reserved_size  = 0x20;
_test_reserved_end   = ORIGIN(ram_main) + LENGTH(ram_main);
_test_reserved_start = _test_reserved_end - _test_reserved_size;

/* Reserving space near the top of the RAM for the stack. */
_stack_size  = 0x2000 - _test_reserved_size;
_stack_end   = _test_reserved_start;
_stack_start = _stack_end - _stack_size;

/* Reserving 128 bytes at the top of ROM for chip info */
_chip_info_size  = 0x80;
_chip_info_end   = ORIGIN(rom) + LENGTH(rom);
_chip_info_start = _chip_info_end - _chip_info_size;

/**
 * NOTE: We have to align each section to word boundaries as our current
 * s19->slm conversion scripts are not able to handle non-word aligned sections.
 */
SECTIONS {
  /**
   * Ibex interrupt vector. See mask_rom_init.S for more information.
   *
   * This has to be set up at the boot address, so that execution jumps to the
   * reset handler correctly.
   */
  .vectors _mask_rom_boot_address : ALIGN(256) {
    KEEP(*(.vectors))
    *(.vectors)
  } > rom

  /**
   * C runtime (CRT) section, containing program initialization code.
   *
   * This is a separate section to `.text` so that the jumps inside `.vectors`
   * will fit into the instruction encoding.
   */
  .crt : ALIGN(4) {
    KEEP(*(.crt))
    *(.crt)
  } > rom

  /**
   * Standard text section, containing program code.
   */
  .text : ALIGN(4) {
    *(.text)
    *(.text.*)
  } > rom

  /**
   * Read-only data section, containing all large compile-time constants, like
   * strings.
   */
  .rodata : ALIGN(4) {
    /* Small read-only data comes before regular read-only data for the same
     * reasons as in the data section */
    *(.srodata)
    *(.srodata.*)
    *(.rodata)
    *(.rodata.*)
  } > rom

  /**
   * Mutable data section, at the bottom of ram_main. This will be initialized
   * from rom at runtime by the CRT.
   *
   * Load this by copying the bytes from [_data_init_start, _data_init_end] into
   * the range [_data_start, _data_end].
   */
  .data ORIGIN(ram_main) : ALIGN(4) {
    _data_start = .;
    _data_init_start = LOADADDR(.data);

    /* This will get loaded into `gp`, and the linker will use that register for
     * accessing data within [-2048,2047] of `__global_pointer$`.
     *
     * This is much cheaper (for small data) than materializing the
     * address and loading from that (which will take one extra instruction).
     */
    __global_pointer$ = . + 2048;

    /* Small data should come before larger data. This helps to ensure small
     * globals are within 2048 bytes of the value of `gp`, making their accesses
     * hopefully only take one instruction. */
    *(.sdata)
    *(.sdata.*)

    /* Other data will likely need multiple instructions to load, so we're less
     * concerned about address materialisation taking more than one instruction.
     */
    *(.data)
    *(.data.*)

    /* Ensure section end is word-aligned. */
    . = ALIGN(4);
    _data_end = .;
    _data_init_end = LOADADDR(.data) + SIZEOF(.data);

    /* This puts it in ram_main at runtime (for the VMA), but puts the section
     * into rom for load time (for the LMA). This is why `_data_init_*` uses
     * `LOADADDR`.
     *
     * Using `AT>` means we don't have to keep track of the next free part of
     * rom, as we do in our other linker scripts. */
  } > ram_main AT> rom

  /**
   * Standard BSS section. This will be zeroed at runtime by the CRT.
   */
  .bss : ALIGN(4) {
    _bss_start = .;

    /* Small BSS comes before regular BSS for the same reasons as in the data
     * section */
    *(.sbss)
    *(.sbss.*)
    *(.bss)
    *(.bss.*)

    /* Any other uninitialized data. */
    *(COMMON)

    /* Ensure section end is word-aligned. */
    . = ALIGN(4);
    _bss_end = .;
  } > ram_main

  /**
   * Immutable chip_info data, containing build-time-recorded information.
   *
   * This is the last thing in rom.
   */
  .chip_info _chip_info_start : ALIGN(4) {
    KEEP(*(.chip_info))
    *(.chip_info)
  } > rom

  /**
   * STAB debug table.
   */
  .stab 0x0 (NOLOAD): {
    [.stab]
  }

  /**
   * STAB debug strings.
   */
  .stabstr 0x0 (NOLOAD): {
    [.stabstr]
  }

  /**
   * The following sections are used by DV to implement logging in an
   * alternate way, which enables simulation speed up by completely avoiding
   * any string format processing or even the actual transmission of log data
   * to a real peripheral.
   *
   * These sections are marked as dummy so that they can still be extracted
   * using readelf or similar utilities. As such, the content in these sections
   * is not relevant for the actual SW code and can be safely discarded.
   */

  /**
   * The following section contains log fields constructed from the logs using
   * the log_fields_t struct defined in sw/device/lib/base/log.h. The size of
   * each log field is fixed - 20 bytes, which is used as the delimiter.
   */
  .logs.fields 0x0 (DSECT): {
    *(.logs.fields)
  }
}
