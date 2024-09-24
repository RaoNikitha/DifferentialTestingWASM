;; 1. Construct an `if` instruction where the condition itself is always false, followed by an `unreachable` instruction inside the `then` block and valid instructions in the `else` block. This test checks if the `unreachable` is erroneously reached.

(assert_invalid
  (module (func $test_unreachable_in_then
    (if (result i32) (i32.const 0) (then (unreachable)) (else (i32.const 42)))
  ))
  "unreachable code in then block"
)