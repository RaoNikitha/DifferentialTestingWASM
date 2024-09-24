;; 7. **Test for Miscounting Label Indices**:    - Design a block where branch instructions miscount the depth of nested blocks, causing the wrong label to be targeted. This validates the handling of label indices.    - Constraint: Proper label indexing.    - CFG Impact: Misaligned CFG due to erroneous label indexing.

(assert_invalid
  (module (func $miscount-label-indices
    (block (block (br 1 (nop))))
  ))
  "unknown label"
)