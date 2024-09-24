;; 1. Test a `br` instruction targeting the innermost label in a deeply nested block structure:    - **Constraint Checked**: Correct resolution of the innermost label when multiple nested blocks are present.    - **Incorrect Branch Target**: If the label lookup fails, the branch might incorrectly target an outer block.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 0 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)