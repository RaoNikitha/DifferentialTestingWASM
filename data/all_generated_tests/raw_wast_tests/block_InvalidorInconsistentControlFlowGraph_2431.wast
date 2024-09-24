;; 2. **Test for Unmatched Branch Inside Block**:    - Include a `br` instruction targeting a non-existent label index within the block. This verifies if the implementation correctly flags incorrect branch targets.    - Constraint: Correct branch label indexing.    - CFG Impact: CFG fails due to incorrect label reference, resulting in unreachable code paths or misaligned branches.

(assert_invalid
  (module (func $test-unmatched-branch-label
    (block (result i32) (br 2) (i32.const 0) (i32.const 1) (end))
  ))
  "unknown label"
)