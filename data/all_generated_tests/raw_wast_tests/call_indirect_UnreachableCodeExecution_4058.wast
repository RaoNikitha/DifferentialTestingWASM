;; 7. **Test Description**: Use a function in the table that performs some computation and includes `unreachable`. Make a `call_indirect` using an invalid table index type so that wrong resolution leads to unreachable.    - **Constraint Checked**: Type soundness in indexing and resolution.    - **Unreachable Code Execution**: Checks traps for table type mismatches to prevent `unreachable` during call resolution.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $compute (result i32)
      (unreachable)
    )
    (table anyref (elem $compute))
    (func (param i32) (result i32)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)