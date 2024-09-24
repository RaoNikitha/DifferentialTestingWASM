;; 1. **Test Unmatched Block with Extra End**:    - Description: Create a block instruction with a valid start but an extra `end` instruction beyond the scope of the block.    - Constraint: This test checks if the implementation can detect and handle unmatched blocks correctly.    - CFG Relevance: Incorrect management of CFG could lead to misaligned branches or erroneous paths.

(assert_invalid
  (module (func (block (i32.const 1)) end))
  "end without block"
)