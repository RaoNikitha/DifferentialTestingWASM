;; 4. **Test Description**: Call a function inside a conditional (if-else) construct where the function's return type does not match the type expected by the conditional branch.    - **Constraint**: This test ensures that conditional branches and their associated function calls are correctly type-checked.    - **Type Mismatch in Control Flow**: The control flow will fail when the expected branch type does not align with the function's actual return type.

(assert_invalid
  (module
    (type $func-i32 (func (result i32)))
    (type $func-void (func))
    (func $foo (result i32)
      (i32.const 42)
    )
    (func $bar
      (if (result i32)
        (then (call $foo))
        (else (call $foo))
      )
    )
  )
  "type mismatch"
)