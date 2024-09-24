;; 1. **Test Description**: Create a function in the table that executes an `unreachable` instruction when called. Use `call_indirect` to reference this function with a valid table index but an incorrect type index.    - **Constraint Checked**: Handles incorrect type index during `call_indirect`.    - **Unreachable Code Execution**: Ensures the call is trapped due to type mismatch before reaching the `unreachable` instruction.

(assert_invalid
  (module
    (func $unreachable-func (unreachable))
    (type $correct-sig (func (param i32)))
    (type $incorrect-sig (func (param f64)))
    (table funcref (elem $unreachable-func))
    (func $call-bad-type (call_indirect (type $incorrect-sig) (i32.const 0) (i32.const 1)))
  )
  "type mismatch"
)