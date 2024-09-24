;; 10. **Incorrect Unwind on Multi-result Block**:     - Create a `block` with a multi-result type `[i32, f32]` and include a `br` instruction intended to unwind the operand stack to this block.     - Check whether the branch correctly maintains the operand types after unwinding, ensuring the incorrect resolution of the block type is identified.

(assert_invalid
  (module (func $incorrect-unwind-multi-result-block (result i32 f32)
    (block (result i32 f32) (br 0 (i32.const 1) (f32.const 1.0)) (i32.const 2) (f32.const 2.0))
  ))
  "type mismatch"
)