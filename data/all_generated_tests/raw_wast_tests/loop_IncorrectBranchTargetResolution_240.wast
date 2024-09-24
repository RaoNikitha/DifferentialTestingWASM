;; 1. **Test 1: Branch Target to Outer Loop**    - Description: Create a nested loop structure with an inner loop branching to an outer loop. Test if branching from the inner loop to the target outer loop correctly resolves and continues execution from the outer loop.    - Constraint: Checks label indexing and context extension for outer loop targets.

(assert_invalid
  (module (func $branch-to-outer-loop
    (loop (result i32)  ;; outer loop
      (loop (result i32)  ;; inner loop
        (br 1)  ;; branch to outer loop
      )
      (drop)
    )
  ))
  "type mismatch"
)