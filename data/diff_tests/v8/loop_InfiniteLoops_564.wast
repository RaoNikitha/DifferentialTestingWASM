;; 5. **Test Name: Indirect Table Loop with Infinite Path**    - **Description**: Use a `br_table` that evaluates to an index pointing to the start of the loop itself, ensuring an infinite backward jump.    - **Constraint Checked**: Proper handling of `br_table` for indirect branching within loops.    - **Infinite Loop Relation**: `br_table` causes loop to restart indefinitely.

(assert_invalid
  (module
    (func (block (br_table 0 (loop (block) (br 1))))
    )
) "type mismatch"
)