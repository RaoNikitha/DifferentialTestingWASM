;; Test 4: A `br_if` instruction targeting a `loop` block where the conditional branch expects an integer type on the stack, but the stack contains a floating-point value due to the previous instructions.

(assert_invalid
  (module (func $br_if-type-mismatch
    (f32.const 0.0) (br_if 0)
  ))
  "type mismatch"
)