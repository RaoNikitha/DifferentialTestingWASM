;; 4. Place an `unreachable` instruction inside the `else` branch of an `if` statement, followed by stack operations. Validate that if the `else` branch is taken, the stack remains unchanged and subsequent instructions are not executed.

(assert_invalid
  (module (func $type-if-else-unreachable (result i32)
    (if (i32.const 0)
      (then (i32.const 1))
      (else (unreachable) (i32.const 2))
    )
  ))
  "type mismatch"
)