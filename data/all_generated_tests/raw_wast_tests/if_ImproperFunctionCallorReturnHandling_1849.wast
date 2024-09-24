;; 10. **Test 10**:    - **Description**: Test an `if` block with mixed direct and indirect function calls returning different types, verifying stack and function table consistency.    - **Constraint**: Ensure that both direct and indirect function calls return the correct values and maintain stack type consistency.    - **Relation**: Checks how the implementation manages both direct and indirect function calls within `if` instructions, ensuring type-safe returns.

(assert_invalid
  (module
    (table 1 funcref)
    (type $vi32 (func))
    (type $i32vi32 (func (result i32)))
    (func $direct_return_void (type $vi32))
    (func $direct_return_i32 (type $i32vi32) (i32.const 42))
    (elem (i32.const 0) $direct_return_i32)
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        (i32.const 1)
        (then (call $direct_return_i32))
        (else (call_indirect (type $vi32) (i32.const 0)))
      )
    )
  )
  "type mismatch"
)