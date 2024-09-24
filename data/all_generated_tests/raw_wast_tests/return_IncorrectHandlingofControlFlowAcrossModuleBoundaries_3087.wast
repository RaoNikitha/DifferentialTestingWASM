;; 6. **Test Import/Export Function Loops with Returns**:    - Description: Create functions in both importing and exporting modules that call each other in loops, with each function returning after some stack operations. Monitor the overall stack integrity and ensure no stack corruption occurs.    - Constraint: Validate that cross-module function calls and returns maintain stack integrity and do not lead to corruption.

(assert_invalid
  (module
    (import "mod" "func" (func $imported (result i32)))
    (func $exported (export "func") (result i32)
      (call $imported)
      (return)
    )
    (func $caller (result i32)
      (call $exported)
      (return)
    )
  )
  "type mismatch"
)