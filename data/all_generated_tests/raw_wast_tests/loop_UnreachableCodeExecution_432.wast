;; 3. **Test Description**: Form a nested loop structure where an inner loop contains an invalid block type leading to an `unreachable` ending path.    - **Constraint**: Ensures the outer and inner loops are validated correctly with their types and labels managed appropriately within nested contexts.    - **Unreachable Code Execution**: Correct type and label validation prevents reaching `unreachable` from improper inner loop handling.

(assert_invalid
  (module
    (func $test-nested-loop
      (loop $outer (result i32)
        (loop $inner (result i32)
          (unreachable)
          (i32.const 1)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)