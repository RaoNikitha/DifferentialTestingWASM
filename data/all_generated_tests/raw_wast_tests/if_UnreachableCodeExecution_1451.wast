;; 2. **Unreachable after Nested `if` within `else`**:    - Nest an `if` instruction within the `else` block. The nested `if` evaluates to false, contains an `unreachable` instruction, testing whether unreachable error is correctly flagged when deeply nested conditions are involved.    - **Constraint**: Ensures nested `if` correctly influences control flow and proper unreachable handling.

(assert_invalid
  (module
    (func $unreachable-after-nested-if
      (if (result i32)
        (i32.const 0)
        (then (i32.const 1))
        (else
          (if (i32.const 0)
            (then (unreachable))
          )
          (i32.const 1)
        )
      )
    )
  )
  "unreachable"
)