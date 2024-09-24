;; 5. **Test Description:** Place `unreachable` after a series of complex nested blocks and loops. This ensures the CFG can correctly flatten and interpret nested structures, ensuring that the trap correctly halts execution across multiple nested levels.    - **Constraint:** Trap should halt all nested execution.    - **Relation to CFG:** Ensures correct CFG interpretation and termination across nested constructs.

(assert_invalid
  (module
    (func $nested-blocks-loops
      (block
        (loop
          (block
            (loop
              (unreachable)
              (i32.const 1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)