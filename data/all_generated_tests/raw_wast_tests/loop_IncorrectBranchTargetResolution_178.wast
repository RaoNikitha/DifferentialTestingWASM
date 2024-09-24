;; 9. **Invalid Branch Out of Loop**:    - Description: Define a loop with a branch explicitly targeting a label that is not a loop. Verify that the invalid branch is correctly flagged and handled.    - Reasoning: Ensures branch validity and proper error handling for incorrect target labels.

(assert_invalid
  (module (func (loop (block $blk (br $blk)))))
  "invalid branch target"
)