;; 2. Design a block that evaluates `br_if` with a zero constant and a non-zero constant in the operand stack, expecting no branch. Verify if the execution wrongly branches, indicating an issue in the condition evaluation of zero vs non-zero values.

(assert_invalid
  (module (func $block-br_if-test
    (block (result i32) 
      (i32.const 1)
      (br_if 0 (i32.const 0)) 
      (i32.add (i32.const 2) (i32.const 3))
    )
  ))
  "type mismatch"
)