;; 9. **Test Description**: Define a `block` containing back-to-back `br_table` instructions, the first properly located but the second one going out of bounds.    - **Constraint**: Ensure consistent behavior and operand stack correctness when transitioning from a valid branch to an out-of-bounds branch.    - **Edge Case**: Multiple sequential br_table to ensure proper handling after valid and invalid branches.

(assert_invalid
  (module (func 
    (block 
      (br_table 0 1)
      (br_table 0 2)
    )
  ))
  "out of bounds br_table"
)