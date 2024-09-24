;; 1. **Test: Incorrect Index Out of Bounds for `br_if`**:    - **Description**: Create a nested structure of blocks, with `br_if` targeting a label index greater than the nesting depth. This test checks if an out-of-bounds error is correctly handled when `br_if` tries to branch to a non-existent label.    - **Constraint Checked**: Ensures that the label index used in `br_if` is within the correct bounds relative to the current nesting depth.    - **Relation to Incorrect Branch Target Resolution**: This test verifies if the engine correctly prevents branching to invalid targets, which is critical for maintaining proper control flow.

(assert_invalid
  (module
    (func (block (block (br_if 2 (i32.const 1)))))
  )
  "unknown label"
)