;; 9. **Mixed Loop and Block Nesting with Complex br_table**:    - Test Description: Construct a module with a combination of loops and blocks at varying depths where `br_table` uses indices targeting both loops and blocks.    - Constraint: Validate the correct dispatch of control flow based on branch table indices, which varies across different depths.    - Relation: This test stresses mixed nesting (loops and blocks) and intricate branching scenarios, likely uncovering any mismanagement of label depth interpretation.

(assert_invalid
  (module
    (func $complex_br_table
      (loop $outer
        (block $inner
          (br_table 0 1 0 (i32.const 0))  ;; Conditional branches targeting both the loop and block
        )
      )
    )
  )
  "type mismatch or invalid target"
)