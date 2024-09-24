;; 5. **Unreachable within Nested Loops:**    - Context: Insert `unreachable` inside an inner loop, which is nested within an outer loop.    - Constraint: The test verifies CFG accurately terminates inner loop execution and properly manages outer loop continuation/prevention.    - Expected Behavior: Both implementations should produce a trap when entering the inner loop, with no iteration possible beyond `unreachable`.

(assert_invalid
  (module
    (func (block 
      (loop 
        (loop 
          (unreachable)
        )
      )
    ))
  )
  "type mismatch"
)