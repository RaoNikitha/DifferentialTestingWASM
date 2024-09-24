;; 10. Embed a `block` with a sequence of arithmetic operations generating the condition for a `br_if` that should branch if the condition is true. It stresses evaluating complex conditions accurately within the block.

(assert_invalid
  (module (func $complex-arithmetic-branch
    (block (result i32)
      (i32.const 10)
      (i32.const 20)
      (i32.add)
      (i32.const 5)
      (i32.div_s)
      (i32.const 6)
      (i32.eq)
      (br_if 0)
      (i32.const 1)
    )
  ))
  "type mismatch"
)