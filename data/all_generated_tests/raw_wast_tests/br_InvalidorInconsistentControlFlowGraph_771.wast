;; 2. **Deeply Nested Loops with Invalid Forward Branch:**    - Construct a module with multiple nested `loop` instructions, and attempt a forward `br` to a label that is outside the scope of the most deeply nested loop.    - Reasoning: This tests if the system properly restricts `br` instructions to valid structured control instructions within proper nesting.    - Relation to CFG: Improperly allowing such a branch could break the nesting structure, resulting in an incorrect CFG.

(assert_invalid
  (module (func
    (block
      (loop
        (loop
          (br 3)
        )
      )
    )
  ))
  "unknown label"
)