;; 1. **Test Description**: Create a block with a type `[i32] -> [i32, i32]` and have nested instructions that consume more than one value from the stack but produce only one. This test checks if the block properly synchronizes the stack even when the resulting count of stack elements deviates from the expected type.

(assert_invalid
  (module (func $differential_block_test (result i32 i32)
    (block (result i32 i32) (i32.const 42) (i32.const 100) (drop) (i32.const 200))
  ))
  "type mismatch"
)