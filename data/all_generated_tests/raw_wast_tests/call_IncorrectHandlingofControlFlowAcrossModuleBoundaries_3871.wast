;; 10. **Nested Imported Calls with Type Mismatch**:    Create nested calls where an imported function calls another with argument types that don’t match. This scenario ensures that both the intermediate and final stack states are strictly validated, showcasing any type mismatches early, especially in the wizard_engine’s `popE`.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (param i32)))
    (type $sig (func (param i64)))
    (func $nested (param i32)
      (call $externalFunc
        (call $nested (i64.const 123))
      )
    )
  )
  "type mismatch"
)