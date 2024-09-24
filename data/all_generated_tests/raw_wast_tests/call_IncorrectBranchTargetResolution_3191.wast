;; 10. **Test with Conditional Branching (if/else)**:     - **Description**: Place `call` instructions within `if` and `else` branches to see which function gets invoked.     - **Constraint**: Validates that conditional branching correctly determines the function to call.     - **Relation to Incorrect Branch Target Resolution**: Errors in resolving branch conditions can cause the wrong block of code (and hence, the wrong function) to be executed.

(assert_invalid
  (module
    (func $f (param i32) (result i32)
      (i32.const 0)
      (if (result i32)
        (i32.const 1)
        (call 1 (i32.const 2))
        (call 2 (i32.const 3))
      )
    )
    (func (param i32) (result i32))
    (func (param i32))
  )
  "type mismatch"
)