;; 2. Use a `br_table` inside a loop nested within another loop, with the selected operand targeting a label that exits the outer loop. This verifies correct handling of nested loop structures and whether the operand correctly directs flow control out of the appropriate loop.

(assert_invalid
  (module
    (func $nested-br_table
      (block
        (loop
          (loop
            (i32.const 0)
            (br_table 0 1 (i32.const 1) (i32.const 2))
          )
        )
      )
    )
  )
  "type mismatch"
)