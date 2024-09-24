;; - Introduce a `loop` structure with a `return` instruction immediately before a `call` function. Check the operand management and final output when the called function returns a different type.

(assert_invalid
  (module (func $type-value-call-mismatch (result i32 f32)
    (i32.const 1) (loop (result i32 f32) (return) (call $dummy))
  ))
  "type mismatch"
)