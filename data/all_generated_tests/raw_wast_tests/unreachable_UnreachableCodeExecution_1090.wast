;; 1. Test an `if` condition with a false predicate immediately followed by the `unreachable` instruction, to check if the incorrect handling of conditionals improperly executes `unreachable`. Validate how each implementation responds when the `if` statement’s condition fails.

(assert_invalid
  (module (func $type-if-then-unreachable (result i32)
    (if (i32.const 0) (then (unreachable)))
    (i32.const 42)
  ))
  "type mismatch"
)