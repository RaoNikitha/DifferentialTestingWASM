;; 10. **Invalid Return Type with Nested `call_indirect`**:     - **Description**: Use a `call_indirect` in a block to call a nested function that returns an invalid type. Test if the block correctly identifies and handles the invalid return type.     - **Constraint**: Check type validation upon nested returns in `call_indirect`.     - **Improper Handling**: Incorrect validation might allow invalid return types, resulting in unexpected behavior.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $t0)
    (func $type-invalid-return-block (result i32)
      (block (result i32)
        (call_indirect (type $t0))
        (f32.const 0.0)
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)