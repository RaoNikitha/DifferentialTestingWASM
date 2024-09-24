;; 1. **Checking Unreachable Code in Direct `else` Execution**:    - The `if` instruction involves a condition that evaluates to false, directly executing the `else` block, which includes an `unreachable` instruction right at the beginning. This tests whether the engine correctly handles jumping to `else` and handles `unreachable` instantly.    - **Constraint**: Validates bypassing `then` block execution and ensures structured flow.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32) (i32.const 0)
        (then (i32.const 1))
        (else unreachable)
      )
    )
  )
  "unreachable code in direct else execution"
)