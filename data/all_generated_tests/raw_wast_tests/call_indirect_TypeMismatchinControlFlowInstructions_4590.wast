;; 9. **Type Mismatch in Nested Control Structures**:    - Test `call_indirect` inside a nested block where the outer block expects a different type than the called function's signature.    - **Constraint**: Ensure type consistency within nested control structures.    - **Relation**: Ensures control flow in nested blocks is correctly governed by type constraints.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param f32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func (block (result i32)
          (call_indirect (type 1) (i32.const 0) (i32.const 42))
          (drop)
          (i32.const 0)
        )
    )
  )
  "type mismatch"
)