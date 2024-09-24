;; 4. **Test Description:**    - Incorporate nested control structures with `br_table` and include `unreachable` within the innermost structure to validate consistent trap behavior.    - **Constraint:** Ensures that inner `unreachable` executions disrupt `br_table` within complex control structures.    - **Relation to Edge Case:** Tests the treatment of nested indices in `br_table` with an `unreachable` interrupt.

(assert_invalid
  (module 
    (func $nested-brtable-unreachable
      (block 
        (loop
          (block 
            (br_table 0 1 2 3 (unreachable))
          )
        )
      )
    )
  )
  "type mismatch"
)