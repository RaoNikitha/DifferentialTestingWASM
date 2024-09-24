;; 3. **Branch to Nonexistent Label**:    Implement a loop with a branch instruction targeting a label index that does not exist in the current scope or any enclosing scope. This tests how the engine manages out-of-bounds label indices.

(assert_invalid
  (module (func $branch-to-nonexistent-label
    (block (loop (block (br 2)))))
  )
  "unknown label"
)