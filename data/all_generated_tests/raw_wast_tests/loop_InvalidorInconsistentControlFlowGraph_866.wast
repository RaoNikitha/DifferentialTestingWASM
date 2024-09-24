;; 7. **Incorrect Label Indexing with Non-Empty Context**:    - Test loops that start with a non-empty context with pre-existing labels and then introduce new labels within the loop. Incorrect handling would cause the labels to be misindexed, affecting the CFG.

(assert_invalid
  (module
    (func
      (block (loop (param i32) (block (br 1))))
    )
  )
  "label index out of bounds"
)