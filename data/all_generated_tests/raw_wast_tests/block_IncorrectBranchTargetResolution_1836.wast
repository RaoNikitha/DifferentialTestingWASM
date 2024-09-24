;; 7. **Nonexistent Label Index in `br_if` Instruction**:    - Include a `br_if` within a `block` that specifies a label index larger than the nesting depth, which refers to a nonexistent label.    - Verify handling of out-of-bounds label references, ensuring the error is caught and processed correctly.

(assert_invalid
  (module (func $br_if_label_out_of_bounds
    (block (br_if 1 (i32.const 1)))
  ))
  "unknown label"
)