;; 5. **Test 5: Return Type Mismatch in Function Call**:    - **Test Description**: Call a function expecting it to return an integer, but it returns a float instead.    - **Constraint**: Ensure the return types are correctly enforced according to the function signature.    - **Type Mismatch**: Inconsistent return types should cause an error.

(assert_invalid
  (module
    (func $return-float (result f32)
      (f32.const 1.0)
    )
    (func $call-float-expect-int (result i32)
      (call $return-float)
    )
  )
  "type mismatch"
)