;; 2. **Nested `if` Br-If Test**:    - **Description**: Within a `block`, include an `if` statement that contains another `block`. Use `br_if` in the inner block to target the outer block. This tests managing label indices in nested conditional structures.    - **Constraint Checked**: Label References and Relative Label Lookup.    - **Expected Failure**: wizard_engine should signal an `OobLabel` error if it mismanages the labels in nested conditionals.

(assert_invalid
  (module
    (func
      (block (result i32)
        (if (result i32)
          (then
            (block (result i32)
              (br_if 1 (i32.const 1))
            )
          )
          (else (i32.const 0))
        )
      )
    )
  )
  "unknown label"
)