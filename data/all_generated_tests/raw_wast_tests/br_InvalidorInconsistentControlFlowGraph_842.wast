;; 3. **Branching into Non-Well-Nested Blocks:**    - **Test Description:** Introduce branches that aim to jump into blocks that aren't well-nested or logically reachable, such as an attempted branch to a nested block without proper enclosing structure.    - **Constraint Tested:** Enforcement of structured control flow rules.    - **CFG Relevance:** Violating structured control flow easily leads to invalid paths in the CFG, resulting in unreachable code or unintended execution flows.

(assert_invalid
  (module
    (func $branch_non_well_nested
      (block
        (block
          (br 1)  ;; Attempt to branch into a non-enclosing block
          (block)
        )
      )
    )
  )
  "invalid branch to non-well-nested block"
)