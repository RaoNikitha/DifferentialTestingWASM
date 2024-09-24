;; 5. **Test Description:** Construct a module with an exported function containing a `br` instruction targeting a deeply nested block. Check if the calling module correctly resumes execution after the `end` of the nested block.    - **Constraint:** Tests forward branch behavior to deeply nested blocks in exported functions.    - **Relation:** Ensures correct control flow resumes after deeply nested blocks in exported functions.

(assert_invalid
  (module
    (func $deeply_nested_br
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (br 7)
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)