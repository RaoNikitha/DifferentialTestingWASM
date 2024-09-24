;; Test 1: Define a block with a block type that specifies an i32 result. Inside the block, use instructions that ultimately leave an f32 on the stack, and attempt to exit the block. This checks whether the block properly validates and enforces the result type before exiting.

(assert_invalid
  (module (func $type-block-i32-vs-f32 (result i32)
    (block (result i32) (f32.const 1.0) (br 0))
  ))
  "type mismatch"
)