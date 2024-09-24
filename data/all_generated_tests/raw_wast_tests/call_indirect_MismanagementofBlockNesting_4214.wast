;; 3. **Test Description**:     Use a WebAssembly module with nested conditional branches (`if` statements) containing `call_indirect` instructions. Use different function types for each branch to test dynamic type checking.    **Constraint**: Ensure the conditional branches navigate correctly and the `call_indirect` instructions are dynamically type-checked properly within the nested conditions.    **Relation to Mismanagement of Block Nesting**: This test verifies that nested `if` branches maintain their structure and correct function type checks.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1 $func2)
    (func $func1 (param i32) (result i32)
      (i32.const 42))
    (func $func2 (result i32)
      (i32.const 0))
    (func (param i32) (result i32)
      (i32.const 0)
      (if (result i32)
        (i32.const 1)
        (then
          (call_indirect (type $sig1) (i32.const 0) (local.get 0))
        )
        (else
          (call_indirect (type $sig2) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)