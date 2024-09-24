;; 4. **Test: Improper Label Indexing in Multiple `if`**    - **Description**: Construct multiple nested `if` instructions where labels are used incorrectly, referencing labels outside their respective blocks.    - **Constraint Checked**: Proper label indexing and referencing within nested blocks.    - **CFG Relevance**: Checks CFG label management to ensure correct references within nested structures.

(assert_invalid
  (module
    (func $nested-if-invalid-label
      (if
        (i32.const 1)
        (then
          (if
            (i32.const 1)
            (then
              (br 1)
            )
          )
        )
      )
    )
  )
  "invalid label"
)