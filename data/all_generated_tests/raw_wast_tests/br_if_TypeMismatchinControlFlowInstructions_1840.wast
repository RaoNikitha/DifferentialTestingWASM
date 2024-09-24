;; 1. **Test 1: Invalid Label Depth**    - **Description**: Construct a test where `br_if` attempts to branch to a label with a depth that's out of bounds (e.g., depth greater than the number of enclosing blocks).    - **Constraint Checked**: Ensure that both implementations handle out-of-bounds label depth correctly, raising an appropriate error.    - **Relation to Type Mismatch**: Ensuring the depth is checked prevents runtime errors due to invalid stack unwinding and operand type mismatch.

(assert_invalid
  (module (func $invalid-label-depth
    (block (br_if 2 (i32.const 1)))
  ))
  "unknown label"
)