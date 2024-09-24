;; 1. **Test Description**:    - Create a function with a sequence of `nop` instructions followed by a valid control instruction, such as `block`. Ensure the `block` context is reset correctly after the `nop` sequence.    - **Constraint Checked**: Valid stack type `[] ! []` maintenance and proper context initialization within nested blocks.    - **Relation to CFG**: Ensures `nop` instructions do not disrupt the CFG by incorrectly resetting the stack or altering control flow within the block.

(assert_invalid
  (module
    (func (block
            (nop) (nop)
            (block (nop))
          )
    )
  )
  "invalid stack operation"
)