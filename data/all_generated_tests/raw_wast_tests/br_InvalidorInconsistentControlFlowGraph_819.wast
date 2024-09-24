;; 10. **Test Description**: Construct a scenario with mislabeled branches within a nested structure that lead to overlapping label indices due to nested levels incorrectly being interpreted.    - **Constraint**: Ensures the CFG correctly maintains and interprets label indices particularly where nested labels may cause index overlaps or misinterpretations.

(assert_invalid
  (module
    (func 
      (block
        (block
          (block
            (br 2)
          )
        )
      )
    )
  )
  "unknown label"
)