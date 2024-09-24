;; 10. **Misalignment with Multi-value Results**:    Test nested blocks where inner blocks end with multi-value results that must be correctly propagated and consumed by the outer blocks. Verify if the operand stack is correctly populated and unwound according to the combined result types of the nested blocks.

(assert_invalid
  (module (func $misalignment-multi-value-nested-blocks
    (block (result i32 f64)
      (block (result i64 f32) 
        (i64.const 1) (f32.const 2.0) (br 0 (i64.const 3) (f32.const 4.0))
      )
      (i32.const 5) (f64.const 6.0)
    )
  ))
  "type mismatch"
)