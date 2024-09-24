;; 10. Use a `select` instruction with one operand being an `unreachable` result and see how subsequent code assuming a specific type handle this, causing a type mismatch in type propagation.

(assert_invalid
  (module (func $type-select-unreachable-type-mismatch
    (select (i32.const 1) (unreachable) (i32.const 0))
  ))
  "type mismatch"
)