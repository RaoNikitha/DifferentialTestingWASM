;; - **Test 2 Description**:   Test block with a function type expectation `[i32] -> [i32]`, but within the block, an `add` operation on `i32` values results in an `f64` to mimic a type mismatch. This will test the implementation's ability to validate the operand stack integrity according to the block type.

(assert_invalid
  (module (func $type-mismatch-stack-integrity (result i32)
    (block (result i32)
      (i32.const 10)
      (i32.const 20)
      (i32.add)
      (f64.const 0.0) 
    )
  ))
  "type mismatch"
)