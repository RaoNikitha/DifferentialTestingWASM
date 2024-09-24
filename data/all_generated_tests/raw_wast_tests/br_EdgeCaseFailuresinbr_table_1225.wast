;; 6. **Default Case Execution:**    - Description: Provide a `br_table` with multiple indices and limit the index in the call to force the use of the default case.    - Verify the correctness of fall-through behavior to the default case when an index does not correspond to any target label.    - Specific Constraint: Enforce the correct execution of the default branch when no other conditions match.

(assert_invalid
  (module
    (func $test-func (param i32)
      (block (result i32)
        (br_table 0 1 2 (local.get 0)) ;; Provide multiple indices
      )
    )
  )
  "type mismatch"
)