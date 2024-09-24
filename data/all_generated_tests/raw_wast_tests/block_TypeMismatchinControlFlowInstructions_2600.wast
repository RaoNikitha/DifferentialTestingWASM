;; Test 1: Create a block with a `valtype` of `i32`, but the instructions within the block only handle `i64` values. This tests if the implementation checks the block type against the actual operand types used inside the block.

(assert_invalid
  (module (func $invalid-block-value-type (result i32)
    (block (result i32) (i64.const 1) (i64.const 2) (i64.add))
  ))
  "type mismatch"
)