;; Implement a `br_table` where the labels vector includes labels from nested loops requiring operand types `i32` and `f64`. The branches must match the operand sequence’s expected unwind and type the control blocks. This ensures all labels are type-checked correctly by the instruction.

(assert_invalid
  (module (func $nested-loop-label-match
    (block
      (loop (result i32)
        (block (result f64)
          (br_table 0 1 2 (i32.const 1))
        )
      )
    )
  ))
  "unknown label"
)