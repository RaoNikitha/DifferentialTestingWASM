;; 8. **Test Description**: Assemble a test involving a `block` instruction that expects a matching `then` type (`f32`) and `else` type (`i32`).    - **Constraint Checked**: Cross-control structure type consistency in nested branching constructs.    - **Expected Behavior**: Different implementations may fail to enforce type alignments across blocks and conditionals.

(assert_invalid
  (module (func (result f32)
    (if (result f32) (i32.const 0)
      (then (f32.const 1.0))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)