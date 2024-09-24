;; 7. **Test Description: Conditional Branch to Non-Existing Label**    - **Reasoning**: The `br_if` attempts to branch to a label index that does not exist in the current context.    - **Constraint Checked**: Validation of label existence in the context.    - **Inconsistent CFG**: Incorrect indexing or entering phases might fail to populate necessary labels.    - **Expected Differential Behavior**: WASM throws a generic error, and wizard_engine signals `OobLabel` for an out-of-bounds reference.

(assert_invalid
  (module
    (func $cond_branch_invalid_label
      (block
        (br_if 3 (i32.const 1))
      )
    )
  )
  "unknown label"
)