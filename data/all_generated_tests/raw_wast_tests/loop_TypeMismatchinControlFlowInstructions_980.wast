;; Test 1: A `loop` instruction with an incorrectly specified `blocktype` that expects an integer input but the instruction sequence pushes a floating-point value.

(assert_invalid
  (module (func $loop-invalid-blocktype (param i32) (result i32)
    (loop (result i32)
      (f32.const 0.0)
      (br 0)
    )
  ))
  "type mismatch"
)