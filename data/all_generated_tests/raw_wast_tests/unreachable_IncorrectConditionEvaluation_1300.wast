;; 1. Insert an `unreachable` instruction inside an `if` condition that is always false, followed by a `br_if` that checks a condition. The test should ensure that reaching the `unreachable` causes an immediate trap and `br_if` is evaluated correctly.

(assert_invalid
  (module (func $type-if-unreachable-br_if
    (if (i32.const 0) (then (unreachable))) (br_if 0 (i32.const 1))
  ))
  "type mismatch"
)