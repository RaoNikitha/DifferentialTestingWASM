;; 2. **Test 2: Call with Incorrect Argument Types**:    - **Test Description**: Define a function that expects integers but call it with floating-point arguments.    - **Constraint**: This test ensures type checking for function arguments is enforced correctly.    - **Type Mismatch**: The mismatched argument types should result in a type error during the function call.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (func $type-mismatch-call (param f64 f64)
      (call 0 (local.get 0) (local.get 1))
    )
  )
  "type mismatch"
)