;; 1. **Basic Branch Target Test within Block:**    - **Description**: Place a `nop` instruction within a `block` structure and then use a `br` instruction to jump out of the block. Ensure the `br` correctly resolves the target label.    - **Constraint Checked**: Validates that the `nop` does not interfere with the `br` instruction's target resolution within the block.    - **Relation to Incorrect Branch Target Resolution**: Ensures the branch targets skip the `nop` without causing incorrect jumps.

(assert_invalid
  (module
    (func (block (nop) (br 0)))
  )
  "invalid branch target"
)