;; 4. **Test with Function Calling Non-Exported Function**:     - **Description**: Call a non-exported function from within another function, ensuring the function is not referenced externally.     - **Constraint Checked**: Validates that non-exported functions are correctly handled and resolved within the module.     - **CFG Relation**: Validates if the CFG handles internal function references correctly without exposing them externally or causing inaccessible paths.

(assert_invalid
  (module
    (func $internal-func (param i32) (result i32)
      local.get 0
    )
    (func $caller-func (param i32) (result i32)
      local.get 0
      call $internal-func
    )
  )
  "call to non-exported function"
)