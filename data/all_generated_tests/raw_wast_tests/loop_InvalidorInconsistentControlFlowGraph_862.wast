;; 3. **Unreachable Code in Loop with Conditional Branches**:    - Include a loop with multiple nested `br_if` instructions that have conditions always evaluating to false. This should create unreachable code paths within the loop body, resulting in an inconsistent CFG.

(assert_invalid
  (module 
    (func $unreachable-branch-in-loop 
      (loop (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 0))
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)