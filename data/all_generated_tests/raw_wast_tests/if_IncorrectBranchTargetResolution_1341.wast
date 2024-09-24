;; 2. **Incorrect `else` Branch Resolution**:    - Define an `if` block where the `else` branch contains a `br` instruction targeting an outer label. The target should be correctly identified as outside the `else` block, preventing an unexpected jump.    - **Constraint**: Verify label resolution within `else` branch respects the outer scope while ensuring proper branching.

(assert_invalid
  (module
    (func $incorrect-else-branch-resolution (result i32)
      (block $outer
        (i32.const 0)
        (if (result i32) (i32.const 1)
          (then (i32.const 42))
          (else (br $outer))
        )
      )
    )
  )
  "invalid branch target in else"
)