;; 7. **Loop Initialization Validation in Nested Contexts**:    - Test Description: Test nested loops where reinitialization of the inner loop occurs frequently, testing if the loop state resets correctly with backward branches (`br`).    - Constraint: Verify that reentry into a loop correctly reinitializes the loop body without disrupting outer contexts.    - Relation: To reveal mismanagement of re-initializations in nested loops, ensuring branches correctly reset the loop context in deeply nested structures.

(assert_invalid
  (module (func $test-nested-loop-reinit
    (loop (result i32)
      (i32.const 42)
      (loop (result i32)
        (i32.const 1)
        (br 1)
      )
      drop
      (i32.const 0)
    )
  ))
  "Nested loop reinitialization and state reset"
)