;; 3. **Nested If with Loop Condition:**    - Test Condition: Place a loop inside an `if` instruction where the loop condition is dependent on the `if` condition.    - Constraint: Proper nesting and label handling within `if` and `loop` contexts.    - Relevance: Tests for correct label indexing and control flow in nested `if` and `loop` structures.

(assert_invalid
  (module
    (func $nested-if-loop
      (if (i32.const 1)
        (then
          (loop (result i32)
            (if (i32.const 0) (then (br 1)))
            (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)