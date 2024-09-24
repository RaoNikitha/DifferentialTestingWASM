;; 2. **Test Nested Loop with Forward Br:**    - **Description:** Implement deeply nested loops where a `br` instruction forwards to an outer block label.    - **Reasoning:** This test verifies if stack unwinding corrects for deeply nested labels and properly restores the stack state.    - **Constraint:** Follow correct label referencing relative to the nesting depth.    - **Relation to Stack Corruption:** Incorrect stack unwinding could lead to corrupted stack states when the branch targets an outer label after several nested loops.

(assert_invalid
  (module
    (func $test
      (block $outer
        (loop $inner
          (block $middle
            (br $outer) ;; forward branch to outer block
          )
        )
      )
    )
  )
  "type mismatch"
)