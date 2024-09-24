;; 6. **Sequential `nops` within a block expecting a result type**:    Use multiple `nop` instructions sequentially within a block that expects a specific result type (e.g., `i64`), and verify the block's validation against the result.    This checks if multiple `nop` instructions are incorrectly assumed to provide a type.

(assert_invalid
  (module (func $block-seq-nops (result i64) (block (nop) (nop) (nop))))
  "type mismatch"
)