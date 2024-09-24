;; 1. **Test Description**: Create a `block` that expects an `i32` type as input but is provided an `f32` type value. This will test if the implementation correctly handles and reports the type mismatch error for the input operand type.

(assert_invalid
  (module (func $type-block-input-mismatch
    (block (param i32) (f32.const 1.0)) 
  ))
  "type mismatch"
)