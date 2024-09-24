;; 7. **Incorrect Branch Depth**:    - Implement a branching scenario where a branch targets a non-existent block depth, leading to CFG inconsistency.    - This ensures proper branch depth validation and error handling within the CFG context.

(assert_invalid
  (module (func $incorrect-branch-depth
    (block (i32.const 42) (br 1))
  ))
  "unknown label"
)