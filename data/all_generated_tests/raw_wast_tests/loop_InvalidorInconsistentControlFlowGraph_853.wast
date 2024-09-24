;; 4. **Invalid Nested Loops**:    - **Description**: Implement a loop containing a nested loop where branches target inappropriate levels (e.g., inner loop tries to `br` to an outer loop).    - **Constraint Checked**: Properly nested structure validation and correct branch handling.    - **CFG Relevance**: Ensures the nested structure in the CFG correctly reflects the loop scopes and branch targets.

(assert_invalid
  (module (func $invalid-nested-loops
    (loop (result i32)
      i32.const 0
      (loop
        (br 2)
      end)
    end)
  ))
  "label 2 out of bounds"
)