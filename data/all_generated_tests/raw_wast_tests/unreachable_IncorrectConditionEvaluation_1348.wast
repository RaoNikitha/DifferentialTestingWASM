;; - Use a conditional expression that should push a result to the stack without executing an `unreachable` instruction within the false branch, validating if incorrect conditions lead to the false branch and subsequent trap.

(assert_invalid
  (module (func $type-conditional-unreachable (result i32)
    (i32.const 1) (if (result i32) (then (i32.const 0)) (else (unreachable)))
  ))
  "type mismatch"
)