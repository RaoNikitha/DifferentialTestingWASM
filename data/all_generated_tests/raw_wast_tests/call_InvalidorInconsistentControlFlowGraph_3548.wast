;; 7. **Test with Nested Function Calls in Loops**:     - **Description**: Use nested function calls within a loop and check for proper loop execution and function invocation.     - **Constraint Checked**: Validates correct loop unrolling and function interdependencies when loops are nested with calls.     - **CFG Relation**: Evaluates the CFG handling of complex loop structures with nested calls, ensuring loops are correctly represented and executed.

(assert_invalid
  (module
    (func $nested-call-in-loop
      (loop
        (call 0 (i32.const 1))
        (br 0)
      )
    )
    (func (param i32) (result i32) (i32.const 0))
  )
  "type mismatch"
)