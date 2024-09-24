;; 7. **Test 7**:    - **Description**: Structure an `if-else` block such that both branches call the same function but with different parameters resulting in different return values.    - **Constraint**: Verify that the parameters passed are accurate, and the correct return values are placed on the stack based on the branch taken.    - **Relation**: Validates the correctness of parameters and return values in repeated function calls across branches.

(assert_invalid
  (module
    (func $diff_test (param i32) (result i32)
      local.get 0
      if (result i32) 
        i32.const 1
        call $diff_test
      else 
        i32.const 2
        call $diff_test
      end
    )
    (func (export "test") (result i32)
      (i32.const 1)
      call $diff_test
    )
  )
  "type mismatch"
)