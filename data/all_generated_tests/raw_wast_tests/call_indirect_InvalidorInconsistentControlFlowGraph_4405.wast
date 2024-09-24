;; **Test 4**: Create a WASM module where the function called indirectly has a mismatched signature (number/types of parameters/return values) compared to the expected function type. This test will check the dynamic function type resolution and its effect on the CFG, ensuring both implementations correctly trap type mismatches and handle operand stack operations.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 i32) (result f32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result f32)
      (call_indirect (type 1) (i32.const 0) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)