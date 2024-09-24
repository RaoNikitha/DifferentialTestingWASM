;; 7. **Test 7: Multiple `nop` Instructions with Branches**:    - **Description**: Introduce multiple `nop` instructions consecutively within a block and see if a subsequent `br` correctly skips these and reaches the labeled target.    - **Constraint**: Ensure `nop` does not stack up to affect the control flow and target jump.    - **Relation to Incorrect Branch Target Resolution**: Checks for cumulative effects of multiple `nop` instructions on branch target resolution.

(assert_invalid
  (module
    (func $test (block $label (nop) (nop) (nop) (br $label)))
  )
  "unknown label"
)