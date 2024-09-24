;; 5. **Test 5**:    - **Description**: Implement an `if` block that calls functions returning values that are subsequently used in further calculations.    - **Constraint**: Validate that function return values are placed correctly on the stack and used accurately in subsequent instructions.    - **Relation**: Examines function call handling and correct usage of return values within the `if` block.

(assert_invalid
  (module
    (func $return_2_i32 (result i32 i32)
      (i32.const 1)
      (i32.const 2)
    )
    (func $test_if_calls
      (if (result i32)
        (i32.const 1)
        (then
          (call $return_2_i32) 
          (i32.add)
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)