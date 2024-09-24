;; 7. **Test: `br_if` Targeting Non-Existent Outer Block**:    - **Description**: Execute `br_if` targeting a label beyond the outermost block (e.g., an index higher than any defined labels).    - **Constraint Checked**: Ensures branches can't target non-existent labels.    - **Relation to Incorrect Branch Target Resolution**: Verifies engines handle out-of-bounds label references, preventing misdirection in control flow.

(assert_invalid
  (module (func $br_if_targeting_non_existent_block
    (block (block (br_if 2 (i32.const 1))))
  ))
  "label out of range"
)