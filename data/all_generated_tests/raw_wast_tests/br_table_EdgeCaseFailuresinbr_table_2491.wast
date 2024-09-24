;; 1. **Out-of-Bounds Index with Empty Label Vector**:    Test a `br_table` instruction where the label vector is empty, and the operand from the stack is non-zero. This checks if the implementation defaults to the provided default label correctly when there are no other labels to index.

(assert_invalid
  (module (func $out_of_bounds_empty_vector
    (block (br_table (i32.const 1))))
  ))