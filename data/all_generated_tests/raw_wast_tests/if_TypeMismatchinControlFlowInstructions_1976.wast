;; Test 7: Insert an `if` statement with a block type expecting `f32` as input but provide an `i32` value on top of the operand stack for condition evaluation.

(assert_invalid
  (module (func $type-mismatch-condition
    (i32.const 0)
    (if (result f32) (i32.const 42) (then (f32.const 1.0)) (else (f32.const 2.0)))
  ))
  "type mismatch"
)