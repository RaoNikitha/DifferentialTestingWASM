;; 9. **Test 9: `unreachable` in Exported Function from Module B Calling Another Exported Function from Module C**    - Description: Module B exports a function that calls another exported function in Module C. Ensure this function in Module C has an `unreachable` statement.    - Constraint Checked: Ensures exported and chained function calls across multiple modules manage traps effectively.    - Relation: Evaluates chain of multiple exported functions handling `unreachable` consistently across different modules.

(assert_invalid
  (module
    (import "moduleC" "funcC" (func $funcC (result i32)))
    (func $funcB (result i32)
      (call $funcC)
      unreachable
    )
    (export "funcB" (func $funcB))
  )
  "type mismatch"
)