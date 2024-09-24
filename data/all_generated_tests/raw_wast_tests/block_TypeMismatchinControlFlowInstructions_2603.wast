;; Test 4: Set up a block with `valtype` of `f64` and use integer arithmetic operations inside the block, ensuring no floating-point operations exist. This will test whether the stack operations conform to the type constraints defined by the block type.

(assert_invalid
  (module (func $type-block-f64-vs-i32
    (block (result f64) (i32.const 10) (i32.const 20) (i32.add))
  ))
  "type mismatch"
)