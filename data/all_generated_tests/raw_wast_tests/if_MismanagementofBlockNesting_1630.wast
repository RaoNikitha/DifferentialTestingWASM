;; 1. Test a nested `if` block where the `else` branch contains another `if` block, and the validation should ensure that both `if` structures have correctly matching `end` keywords.    - **Constraint**: Ensure proper nesting by matching `end` keywords and correct jumping.    - **Behavior**: Mismanagement should result in control flow jumping to the wrong block.

(assert_invalid
  (module
    (func $nested-if-else-with-mismatch-end
      (if (result i32)
        (i32.const 1)
        (then
          (i32.const 3)
        )
        (else
          (if (result i32)
            (i32.const 0)
            (then
              (i32.const 2)
            )
            (else
              (i32.const 3)
            )
          ) ;; missing 'end' for inner if
        )
      )
    )
  )
  "mismatched end"
)