;; 6. **Test Description**:    Insert `nop` in deeply nested control structures (e.g., blocks within blocks). Ensure stack is correctly managed and remains as expected at every nesting level.    **Constraint Checked**: Confirms deep nesting maintains stack integrity.    **Relation to Stack Corruption**: Failure might lead to cumulative stack corruption across nested structures.

(assert_invalid
  (module
    (func $nested-nops
      (block 
        (block 
          (block 
            (block 
              (nop)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)