;; 8. **Instruction Stack Inconsistency**:    - Construct a loop that has inconsistent stack operations (e.g., push/pop) within its instructions, causing preconditions to be unmet. The resulting CFG would be invalid due to stack inconsistencies.

(assert_invalid
  (module (func $inconsistent-stack
    (loop (result i32)
      (i32.const 1)
      (drop)
      (drop)
    )
  ))
  "type mismatch"
)