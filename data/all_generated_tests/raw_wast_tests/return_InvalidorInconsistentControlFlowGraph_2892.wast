;; 1. **Empty Function Body Return**:    Test a function with no operations before the `return` instruction.    - Checks for proper stack unwinding and operand handling in an empty block context.

(assert_invalid
  (module
    (func $empty-body-return
      (return)
    )
  )
  "type mismatch"
)