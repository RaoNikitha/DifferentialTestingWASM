;; 6. **Test 6: Incorrect Condition Evaluation with Mixed Type Conditions**    - Test a `br_if` condition that uses mixed types (e.g., comparing `i32` and `i64` using a cast or multi-type operation). Verify correct condition evaluation.    - **Constraint Checked**: Proper handling and evaluation of mixed-type conditions in branching.

(assert_invalid
  (module (func $mixed-type-condition-br_if
    (block (result i32)
      (br_if 0 (i32.const 1) (i64.eqz (i64.const 0)))
    )
  ))
  "type mismatch"
)