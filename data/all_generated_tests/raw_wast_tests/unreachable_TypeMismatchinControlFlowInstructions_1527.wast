;; 8. Implement an `if` instruction where the `then` contains an `unreachable` and the `else` contains a return value, followed by an instruction sequence assuming the `if` produces a consistent result type, causing a type mismatch.

(assert_invalid
  (module (func $type-if-unreachable-then-value-else
    (if (i32.const 0) (then (unreachable)) (else (i32.const 0)))
    (i32.add (local.get 0) (i32.const 1))
  ))
  "type mismatch"
)