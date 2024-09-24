;; 4. **Test Description:**    - **Scenario:** Nest the `unreachable` instruction within a series of nested blocks and ensure it’s not supposed to be executed.    - **Constraint Checked:** Ensures that blocks that unexpectedly don’t exit correctly trap due to the `unreachable`.    - **Relation to Unreachable Code Execution:** Tests control flow mismanagement where deep nesting and exit conditions could erroneously trigger `unreachable`.

(assert_invalid
  (module (func $deeply_nested_blocks
    (block 
      (block 
        (block 
          (block 
            (unreachable)
            (return)
          )
          (return)
        )
        (return)
      )
      (return)
    )
    (i32.const 1)
  ))
  "unreachable instruction executed in deeply nested blocks"
)