;; 9. Design a function with `unreachable` followed by an `else` branch of an `if` statement containing a `call` instruction. Check if the `unreachable` traps correctly without reaching the `call`.

(assert_invalid
  (module (func $type-unreachable-followed-by-else-call
    (if (i32.const 0) (then (unreachable)) (else (call 0)))
  ))
  "type mismatch"
)