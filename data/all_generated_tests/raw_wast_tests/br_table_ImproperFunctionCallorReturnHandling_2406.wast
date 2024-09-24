;; 6. **Test 6: Default Label Leading to Wrong Function Return**    - Test a `br_table` with a default label leading to a return statement with incorrect arity compared to other labels. This checks if the error in default branching handling is correctly identified and avoids improper function return.

(assert_invalid
  (module
    (func $default_label_return_wrong_arity (result i32)
      (block
        (br_table 0 (i32.const 1)) 
        (return (i32.const 0) (i32.const 1))
      )
    )
  )
  "type mismatch"
)