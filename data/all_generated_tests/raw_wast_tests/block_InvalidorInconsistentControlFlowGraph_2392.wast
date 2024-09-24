;; 3. **Test a block spanning multiple nested loops with immediate branching out to the outermost block**:    - **Constraint Checked**: Checks if control flow graph properly represents nested places and outward directed branches.    - **Reasoning**: Branching out directly from nested loops tests accurate label management and CFG interpretation.

(assert_invalid
  (module (func $test-block-nested-branches
    (block (result i32)
      (loop (br 1 (i32.const 1)) (br 0))
    )
  ))
  "type mismatch"
)