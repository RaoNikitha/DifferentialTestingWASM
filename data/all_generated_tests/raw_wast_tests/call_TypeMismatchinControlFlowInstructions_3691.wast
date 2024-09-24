;; 10. **Test Description**: Execute a function call returning multiple types within an `if` block where each branch of the `if` expects a different set of types.     - **Constraint**: This test examines the type enforcement mechanisms for returned types in conditional branches with diverse type expectations.     - **Type Mismatch in Control Flow**: The type mismatch between the returned function types and the types expected by each branch causes type errors upon conditional execution.  Each of these tests aims to exploit potential differential behavior in handling type mismatches in the control flow instructions, focusing specifically on the handling and validation of type constraints during function calls within various control structures.

(assert_invalid
  (module
    (func $multi_return (result i32 f64) (i32.const 1) (f64.const 1.0))
    (func (result i32)
      (if (i32.const 1)
        (then (call $multi_return) (drop) (drop) (i32.const 0))
        (else (i32.const 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)