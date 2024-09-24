;; 4. **Test Input: Mixed Branch Tables and Loops**    - Description: Test the `br_table` instruction with indices that navigate various `loop` and `block` constructs to ensure correct branching.    - Constraint: Ensure switch-case style indirect branches resolve correct labels for mixed constructs.    - Focus: Assess the resolution of branch tables involving multiple nested loops.

(assert_invalid
  (module (func $mixed-branch-table (param i32) (result i32)
    (block $outer
      (loop $inner (result i32)
        (block $mid (loop $innermost (br_table $outer $mid $inner $innermost (local.get 0)))))
      (i32.const 0)
    )
  ))
  "type mismatch"
)