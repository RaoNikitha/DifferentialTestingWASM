;; 8. **Test Description**: Call a function with mismatched parameter types against the expected types and verify if an appropriate error is raised without proceeding to stack corruption.    **Constraint Checked**: Parameter type matching.    **Relation to Stack Corruption**: Type mismatch might compromise stack integrity if not properly checked.

(assert_invalid
  (module
    (func $mismatch-params (call 1 (i32.const 0) (f32.const 0.0)))
    (func (param i64))
  )
  "type mismatch"
)