;; 9. Frame an `if-else` block where the `else` part includes arithmetic operations and a premature `unreachable` instruction in case of wrong operand stack management or error handling capture.

(assert_invalid
  (module (func $type-else-arithmetic-unreachable (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 10))
      (else (i32.add (unreachable))) (i32.const 20))
  ))
  "type mismatch"
)