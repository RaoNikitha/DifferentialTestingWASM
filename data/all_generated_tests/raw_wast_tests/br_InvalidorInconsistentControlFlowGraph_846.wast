;; 7. **Deeply Nested If-Else Structures with Inconsistent Branching:**    - **Test Description:** Create complex nested `if-else` structures where `br` instructions attempt to branch to various depths. Include scenarios where labels should be interpreted differently in nested `if-else` contexts.    - **Constraint Tested:** Correct handling of `br` in nested `if-else` structures.    - **CFG Relevance:** Mismanagement of `br` in nested conditions can create inconsistent or unreachable CFG paths.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i32)
          (if (result i32)
            (then 
              (if 
                (then 
                  (br 2)
                )
              )
            )
            (else 
              (br 1)
            )
          )
        )
      )
      (i32.add)
    )
  )
  "type mismatch"
)