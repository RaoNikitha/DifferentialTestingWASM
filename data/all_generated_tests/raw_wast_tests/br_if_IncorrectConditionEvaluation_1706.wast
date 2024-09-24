;; 7. **Test Description**: Within an `if-else` structure, use a `br_if` that references a label in an outer block. Set the `br_if` condition to false and verify no branch occurs, testing different operand values.    - **Constraint Checked**: Ensures correct relative label indexing and conditional checks for outer block labels.    - **Relation to Incorrect Evaluation**: Checks for bugs where the `br_if` might branch incorrectly due to faulty condition evaluation.

(assert_invalid
  (module
    (func $test-if-else-br_if-outer-label
      (block $outer
        (if
          (i32.const 0)
          (then
            (br_if 1 (i32.const 0))
          )
          (else
            (br_if 1 (i32.const 0))
          )
        )
      )
    )
  )
  "unknown label"
)