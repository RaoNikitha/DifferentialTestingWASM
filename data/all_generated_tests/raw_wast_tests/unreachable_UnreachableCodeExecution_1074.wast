;; 5. Combine `if-else` structures with the `unreachable` instruction placed in the `else` path, testing if the implementations correctly trap only when the condition is false.

(assert_invalid
  (module (func $test-if-else-unreachable (result i32)
    (if (result i32)
      (i32.const 1)
      (then (i32.const 1))
      (else (unreachable))
    )
  ))
  "type mismatch"
)