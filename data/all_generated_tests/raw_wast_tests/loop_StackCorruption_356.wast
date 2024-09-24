;; 7. **Test Recursive Loop Execution**:    - Design a loop that calls a function which contains another loop, leading to recursive loop executions. Validate stack state before and after recursion.    - **Constraint**: Proper handling of stack frames for recursive loop executions.    - **Relation to Stack Corruption**: Recursive execution can quickly lead to stack overflow or underflow if not managed properly.

(assert_invalid
  (module (func $recursive-loops (result i32)
    (loop $outer (result i32)
      (call $inner-loop)
    )
  )
  (func $inner-loop (result i32)
    (loop $inner (result i32)
      (br $outer)
    )
  ))
  "unknown label"
)