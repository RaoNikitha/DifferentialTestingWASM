;; 9. **Test Description**: Use a `br_if` immediately after another control flow instruction like `br`. Set conditions to false and test no branch is taken in complex control flow scenarios.    - **Constraint Checked**: Verifies `br_if` performs isolated evaluation without unwanted interference from preceding control flow instructions.    - **Relation to Incorrect Evaluation**: Detects incorrect branch operations affected by previous control flow state.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (br 0) (br_if 0 (i32.const 0))
        )
      )
    )
  )
  "unknown label"
)