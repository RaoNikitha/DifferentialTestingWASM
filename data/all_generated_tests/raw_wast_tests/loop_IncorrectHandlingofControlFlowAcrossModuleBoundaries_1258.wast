;; 9. **Function Call with Loop Reentry Across Module**:    - Test when a loop in one module calls a function in another module that loops back into the original module’s function. Validate that the loop reentry maintains correct stack and control flow.    - **Constraint**: Checks for proper loop reentry handling and stack integrity across nested module boundaries.

(assert_invalid
  (module
    (import "env" "some_func" (func $some_func))
    (func $caller
      (call $some_func)
      (loop (param i32) (br 0))
    )
  )
  "inline block type"
)