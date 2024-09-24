;; 2. **Test 2**:    - **Description**: Test an `if-else` block where the `if` branch calls one function and the `else` branch calls another, returning different result types.    - **Constraint**: Verify that the appropriate function is called based on the `i32` condition and that the return value matches the expected type in each branch.    - **Relation**: This test ensures differential handling of function calls and return types in `if-else` branches.

(assert_invalid
  (module
    (func $ret_i32 (result i32)
      (i32.const 42))
    (func $ret_i64 (result i64)
      (i64.const 42))
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (call $ret_i64))
        (else
          (call $ret_i32))))
  )
  "type mismatch"
)