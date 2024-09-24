;; 8. **Multiple Nested Blocks with Misdirected Branch**:    - **Description**: Test multiple nested blocks within a loop where branches attempt to resolve to the wrong block due to misdirected label resolution.    - **Constraint**: Correct target resolution for branch instructions, ensuring they point to the intended blocks.

(assert_invalid
  (module (func $misdirected-branch
    (block (block (loop $label (block (br 3)))))
  ))
  "unknown label"