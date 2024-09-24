;; Create a test with an `if` instruction where the `blocktype` specifies that no values are produced (`[] -> []`), but the `then` or `else` block push an `i32` value on the stack. This will check if both implementations are handling the case where block types are violated.

(assert_invalid
  (module (func $test-if-blocktype-violation
    (i32.const 1)
    (if (result) (i32.const 1) (then (i32.const 42)) (else (i32.const 42)))
  ))
  "type mismatch"
)