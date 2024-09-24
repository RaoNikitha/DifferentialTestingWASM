;; Test a combination of `br_table` within a `loop` inside a block, targeting various labels to evaluate if the control flow exits correctly or results in infinite loops due to improper label stack management.

(assert_invalid
  (module (func $test-br_table-loop-block (result i32)
    (block (result i32)
      (loop (result i32)
        (br_table 0 1 (i32.const 0))
        (i32.const 1)
      )
      (i32.const 2)
    )
  ))
  "type mismatch"
)