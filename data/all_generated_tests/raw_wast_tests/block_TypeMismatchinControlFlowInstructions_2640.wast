;; 1. Create a block instruction with a block type that expects an `i32` value as its result, but the contained instructions produce an `f32` value. This tests whether both implementations correctly identify and handle type mismatches when exiting a block.

(assert_invalid
  (module (func $type-mismatch-block (result i32)
    (block (result i32) (f32.const 1.0) (br 0))
  ))
  "type mismatch"
)