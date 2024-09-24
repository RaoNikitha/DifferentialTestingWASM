;; 5. Test Description 5: Design a `br_table` instruction with label indices that expect an i32 operand while providing a floating-point operand on the stack.

(assert_invalid
  (module (func
    (block (br_table 0 (f32.const 1.0)) (i32.const 1))
  ))
  "type mismatch"
)