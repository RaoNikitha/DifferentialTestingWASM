;; 8. Design an `if` instruction where the operand stack type right before the `if` condition does not resolve to `i32`, thereby disrupting expected input stack constraints.

(assert_invalid
  (module (func $type-mismatch-before-if (result i32)
    (if (result i32) (f64.const 1.0)
      (then (i32.const 1))
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)