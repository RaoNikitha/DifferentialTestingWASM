;; 10. **Comparison of Global Variables within Loop**    - Implement a loop where the condition for `br_if` is based on the comparison of global variables that may change with each loop iteration. Ensure correct branching only occurs when the comparison condition holds.    - **Reason**: Tests the accurate evaluation of `br_if` conditions based on global variables that are modified within the loop.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $test
      (loop (result i32)
        (global.set $g (i32.add (global.get $g) (i32.const 1)))
        (br_if 0 (i32.eq (global.get $g) (i32.const 5)))
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)