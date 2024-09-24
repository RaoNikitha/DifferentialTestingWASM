;; 2. **Conditional with Unreachable Else Branch:**    - Context: Construct an `if` block where the `else` branch contains only the `unreachable` instruction.    - Constraint: Check whether CFG properly handles the unreachable-ness of the `else` branch and doesn’t allow control flow to exit normally.    - Expected Behavior: When the condition is false, a trap should occur. Both implementations should handle this uniformly.

(assert_invalid
  (module (func $conditional-with-unreachable-else (param i32) (result i32)
    (if (local.get 0)
      (then (i32.const 1))
      (else (unreachable) (i32.const 0))
    )
  ))
  "type mismatch"
)