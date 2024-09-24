;; 4. **Loop with Misaligned Labels**:     - **Description**: Design a loop wherein a branch refers to an incorrect label index. Test if the label indices are managed properly and validate correct branch destination targeting.     - **Constraint**: Proper handling of branch targets with label indices.     - **CFG Impact**: Any misalignment in labels will result in an incorrect branch target causing CFG discrepancies.

(assert_invalid
  (module (func $loop-misaligned-labels
    (block (loop (result i32) (br 2)) (i32.const 1))
  ))
  "unknown label"
)