;; 1. **Single `nop` within a block, mismatched block result type**:    Insert a `nop` instruction inside a block that expects a specific result type (e.g., `i32`), but the block does not provide any result.    This tests the block's type-checking to ensure the `nop` does not alter the expected result type.

(assert_invalid
  (module
    (func
      (block (result i32)
        (nop)
      )
    )
  )
  "type mismatch"
)