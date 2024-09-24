;; 7. **Block Type Mismatch Handling**:    Create blocks where the `br` instruction's target and the block's result type potentially mismatch, revealing if the context and type constraints are correctly enforced during branch resolution.

(assert_invalid
  (module (func $block-type-mismatch
    (block (result i32) 
      (br 0 (f32.const 1.0))
      (i32.const 1))
  ))
  "type mismatch"
)