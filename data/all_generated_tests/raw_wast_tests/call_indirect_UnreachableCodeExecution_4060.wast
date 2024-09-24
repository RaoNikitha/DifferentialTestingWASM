;; 9. **Test Description**: Use `call_indirect` with nested indirect calls within functions. If nested calls fail, they execute `unreachable`. Create a scenario leading to incorrect nesting resolution.    - **Constraint Checked**: Valid nesting of indirect calls.    - **Unreachable Code Execution**: Ensures traps during improper nested calls stop execution before reaching `unreachable`.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32)))
    (table funcref (elem $type_mismatch_1 $type_mismatch_2))
    (func $type_mismatch_1 (param i32) (result i32)
      (call_indirect (type $sig2) (i32.const 0))
    )
    (func $type_mismatch_2 (param i32)
      (call_indirect (type $sig1) (i32.const 1))
    )
    (func $nested_indirect
      (call_indirect (type $sig1) (i32.const 0))
      (unreachable)
    )
  )
  "nested call_indirect type mismatch"
)