;; - **Test 1 Description**:   Validate a basic `block` instruction that expects an `i32` input but receives an `f64` input instead. This test will check if the engine correctly identifies and handles the type mismatch between the expected operand type and the actual operand type on the stack. It will highlight type enforcement for the instruction sequence within the block.

(assert_invalid
  (module (func $invalid-block-type (result i32)
    (block (result i32) (f64.const 1.0))
  ))
  "type mismatch"
)