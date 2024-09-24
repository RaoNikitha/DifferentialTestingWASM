;; 10. **Test 10: Loop with Multiple Function Calls and Incorrect Frame Management**     - **Constraint:** Proper management of execution frames and stack depth within loops.     - **Description:** Create a loop with several function calls that each interact with execution frames. Incorrect management of frames within the loop should result in an infinite loop scenario.

(assert_invalid
  (module
    (func $test-loop
      (loop $label
        (call $func1)
        (call $func2)
        (br $label)
      )
    )
    (func $func1)
    (func $func2 (result i32) (i32.const 42))
  )
  "type mismatch"
)