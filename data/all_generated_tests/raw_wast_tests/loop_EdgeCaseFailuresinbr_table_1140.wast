;; - Test a `loop` block with a `br_table` where the table index is exactly on the boundary of valid indices, ensuring both implementations handle it without errors and branch to the expected target.

(assert_invalid
  (module
    (func $test (result i32)
      (loop $loop (result i32)
        (i32.const 0)
        (i32.const 1)
        (br_table 0 $loop)
      )
    )
  )
  "type mismatch"
)