;; 8. **Test 8**:    - **Description**: An `if` block expecting `i64` results, with a `br_if` in the else branch evaluating an `i32` and attempting to push `i64`.    - **Constraint**: Ensures that branching within if-else respects both branches' type constraints.    - **Relation to Type Mismatch**: Checks for misalignment in type constraints in conditional branching scenarios.

(assert_invalid
  (module
    (func $test_8
      (if (result i64)
        (then (i64.const 42))
        (else (br_if 0 (i32.const 1) (i64.const 7)))
      )
    )
  )
  "type mismatch"
)