;; 1. **Test for Inner `if` Block Resolution Error**:    Create a nested `if` block within another `if` statement, both having the same label names/categories. Validate the resolution of the inner `if` block to correctly jump to its corresponding `else` and `end`.    - **Constraint**: Ensure the inner `if` block label does not interfere with the outer block’s label resolution.    - **Expectation**: Inner `if` should resolve its branches correctly internally.

(assert_invalid
  (module
    (func $nested_if_same_label
      (i32.const 1)
      (if (result i32)
        (i32.const 1)
        (if (result i32)
          (i32.const 1)
          (then (i32.const 2))
          (else (i32.const 3))
        )
        (else (i32.const 4))
      )
    )
  )
  "block label resolution error"
)