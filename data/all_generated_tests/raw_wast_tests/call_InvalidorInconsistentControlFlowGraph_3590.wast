;; 9. **Incorrect Return Value Handling**:    - **Test Description**: Call a function and attempt to push its return values onto the stack in an invalid order.    - **Constraint Checked**: Return value stack operations.    - **CFG Relevance**: Ensures that the CFG correctly maintains stack order and state after function calls.

(assert_invalid
  (module
    (type $ret-mismatch (func (result i32 i64)))
    (func $invalid-return (result i32 i64)
      (i32.const 42)
      (i64.const 100)
      (return)
    )
    (func $Caller (call $invalid-return))
  )
  "type mismatch"
)