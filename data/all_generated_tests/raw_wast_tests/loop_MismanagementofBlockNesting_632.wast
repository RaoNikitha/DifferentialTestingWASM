;; 3. **Conditional Branching in Nested Loops**:    Implement nested loops where the inner loop contains `br_if` instructions to conditionally branch to the outer loop. This checks if the branched-to loop is correctly reinitialized and execution resumes from the intended loop's start, testing the correctness of conditional branching within nested structures.

(assert_invalid
  (module (func $nested-conditional-branching
    (block (loop (block 
      (loop (result i32)
        (br_if 0 (i32.const 1))
        (i32.const 0)
        (drop)
      )
      (br_if 0 (i32.const 0))
    )))
  ))
  "type mismatch"
)