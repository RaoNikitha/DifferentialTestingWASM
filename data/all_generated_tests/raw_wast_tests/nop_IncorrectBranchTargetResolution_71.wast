;; 2. **Nested Blocks with `nop`:**    - **Description**: Create nested `block` structures with `nop` instructions in different positions. Use `br` to jump to specific blocks and validate that the correct block is targeted.    - **Constraint Checked**: Validates that `nop` does not corrupt label resolution within nested blocks.    - **Relation to Incorrect Branch Target Resolution**: Confirms `nop` does not cause misinterpretation of nested block labels.

(assert_invalid
  (module
    (func (block (nop) (block (br 1) (nop))) (nop))
  )
  "invalid label"
)