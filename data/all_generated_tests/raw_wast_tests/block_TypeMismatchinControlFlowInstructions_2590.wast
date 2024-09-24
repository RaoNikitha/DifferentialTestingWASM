;; 1. **Test 1**: Define a `block` with a `blocktype` that expects an `i32` but provide instructions that only produce an `f32`. This checks the handling of type mismatch in the block’s expected output type.

(assert_invalid
  (module (func $block-type-mismatch (result i32)
    (block (result i32) (f32.const 1.0))
  ))
  "type mismatch"
)