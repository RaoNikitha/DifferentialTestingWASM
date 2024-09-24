;; 4. **Test Description**:    Implement a `block` instruction with nested blocks, where the inner block's end type does not match the outer block's start type, and confirm that a type mismatch error occurs.    **Constraint:** Validating type consistency across nested blocks.    **Relation to Type Mismatch:** Checks type compatibility in nested control flows.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result f32)
          (f32.const 1.0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)