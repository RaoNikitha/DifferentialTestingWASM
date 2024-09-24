;; 2. **Test 2**:    - **Description**: A nested loop with an inner `br_if` instruction targeting the outer loop’s start. Include stack operands to check consistent stack unwinding when condition is true.    - **Constraint**: Ensuring operations target the correct loop with appropriate operand handling.    - **CFG Relation**: Validates CFG consistency for backward jumps within nested loops.

(assert_invalid
  (module
    (func $nested-loop-br_if
      (loop $outer
        (i32.const 1)
        (loop $inner
          (br_if $outer (i32.const 1))
        )
      )
    )
  )
  "mismatched type: br_if should target the correct loop"
)