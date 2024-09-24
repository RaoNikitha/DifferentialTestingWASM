;; 3. Use nested `if` instructions where the outer condition is false and the inner `then` block has an `unreachable` instruction. Ensure that the inner `else` has valid code to check accurate branching within nested constructs.

(assert_invalid
  (module (func $nested-if-unreachable
    (if (result i32)
      (i32.const 0)
      (then
        (if (i32.const 1)
          (then (unreachable))
          (else (i32.const 42))
        )
      )
      (else (i32.const 10))
    )
  ))
  "type mismatch"
)