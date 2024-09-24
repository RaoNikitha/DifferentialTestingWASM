;; 1. **Mismatched Block Result Type**: Create a `block` that specifies a result type of `i32`, but the instructions inside the block produce a `f32` instead. This will test if the implementations properly check that the instructions' output matches the block's declared result type.

(assert_invalid
  (module (func $mismatched-block-result-type
    (block (result i32) (f32.const 1.0))
  ))
  "type mismatch"
)