;; Sure, here are the test descriptions:  ### Test Descriptions:  **Test 1**: Test a function call with the correct argument types. Ensure the correct function is invoked and returns expected results by nested calls. Check if the conditions for execution are evaluated correctly.

(assert_invalid
  (module
    (func $outer (param i32) (result i32)
      (call $inner (get_local 0))
    )
    (func $inner (param i32) (result i32)
      (i32.add (get_local 0) (i32.const 10))
    )
  )
  "unknown function"
)