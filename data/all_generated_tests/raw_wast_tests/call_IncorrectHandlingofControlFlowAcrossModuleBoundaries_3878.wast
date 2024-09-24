;; 7. **Return Value Propagation Across Module Boundaries**:    - **Constraint Checked**: Tests if return values from imported functions are correctly returned back to the original calling function.    - **Description**: Call an imported function from one module which itself calls another local function returning multiple values. Verify if the final calling sequence receives all return values accurately.

(assert_invalid
  (module
    (import "mod" "func" (func $imported (result i32 i32)))
    (func $caller
      (call $imported)
      (drop)
    )
  )
  "type mismatch"
)