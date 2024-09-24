;; 1. **Test for Stack State after `nop` inside `block`**:    - **Description**: Define a `block` instruction with a `nop` inside it, followed by a type-checking operation that expects the stack to be unchanged.    - **Constraint Checked**: Ensures that `nop` within a `block` does not affect the operand stack state.    - **Relation**: Targeted toward improper type resetting that might affect subsequent instructions.

(assert_invalid
  (module (func (block (nop) (i32.const 1) (drop))))
  "type mismatch"
)