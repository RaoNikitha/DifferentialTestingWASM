;; 2. Use an `if` instruction with a `br_if` inside it, where the condition is always true (`1`). Ensure the `br_if` correctly branches to the specified target. This test ensures the correct execution of the branch on a true condition.

(assert_invalid 
  (module
    (func $nested-br-if (result i32)
      (i32.const 1)
      (if (result i32) (i32.const 1)
        (then (br_if 0 (i32.const 1)))
        (else (i32.const 2))
      ) 
    )
  )
  "type mismatch"
)