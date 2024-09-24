;; Test 2: Design a block that expects an input type of `f32` but internally processes `i32` values and outputs an `i32` value. This will test whether the branch unwinding correctly rewinds the operand stack to match the block's input and output types.

(assert_invalid
  (module (func $block_type_mismatch (param f32) (result i32)
    (block (result i32)
      (i32.const 1)
      (f32.const 1.0)
      (br 0)
    )
  ))
  "type mismatch"
)