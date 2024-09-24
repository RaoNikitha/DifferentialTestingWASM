;; 2. **Test Case: Unreachable in Conditional Block**    - Description: Use the `unreachable` instruction within an `if` block to see if the trap is executed when the condition is met.    - CFG Constraint: Ensuring that the control flow correctly stops at the `unreachable` instruction within the conditional block, ignoring any further instructions.

(assert_invalid
  (module
    (func $test_unreachable_in_conditional (param i32) (result i32)
      (if (local.get 0)
        (then (unreachable) (i32.const 1))
        (else (i32.const 2))
      )
    )
  )
 "type mismatch"
)