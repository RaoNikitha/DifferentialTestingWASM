;; 1. **Test Description**:    This test will include deeply nested `block` structures with multiple `nop` instructions scattered within. It will validate that the `nop` instruction does not affect the correct nesting and exiting of the `block` structures.

(assert_invalid
  (module (func $nested-blocks (block (block (block (block (nop) (nop)) (block (nop)) (nop)) (nop)) (nop)))
  "invalid block structure"
)