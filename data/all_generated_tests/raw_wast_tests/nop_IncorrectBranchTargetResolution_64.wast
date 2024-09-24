;; Include `nop` instructions in a series of interleaved `block`, `if`, and `loop` structures with `br_table` instructions to verify that the table-based branching resolves to the correct targets without `nop` interfering in either implementation.

(assert_invalid
  (module
    (func $mixed_control
      (block
        (nop)
        (br_table 0 0 (block (nop)))
        (if (i32.const 1)
          (then (nop) (br 0))
          (else (nop)))
        (loop
          (nop)
          (br_table 0 0 (loop (nop))))
      )
    )
  )
)