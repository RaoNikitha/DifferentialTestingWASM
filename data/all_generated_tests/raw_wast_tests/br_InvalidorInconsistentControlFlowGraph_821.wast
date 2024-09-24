;; 2. **Test for Incorrect Label Indexing:**    - **Description**: A deeply nested structure with a `br` to a label index that misinterprets the nesting depth.    - **Constraint Checked**: Correct label indexing relative to nesting depth.    - **Relation to CFG**: Ensures proper interpretation of relative label indices to maintain CFG correctness.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (br 3)
          )
        )
      )
    )
  )
  "unknown label"
)