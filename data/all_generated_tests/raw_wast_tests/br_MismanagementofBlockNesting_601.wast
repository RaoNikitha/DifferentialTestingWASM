;; 2. Test Description: **Nested Loops with Forward and Backward Branches**    - Implement a scenario with several nested loops wherein a `br` instruction aims to jump forward to a block outside a mid-level loop, while another `br` targets backward at the start of the loop. Check if each branch executes correctly.    - Constraint: Ensures backward and forward branching adherence within nested loops.

(assert_invalid
  (module
    (func $nested-loops
      (block
        (loop
          (block
            (loop
              (br 3)  ;; Forward branch to the outermost block
              (br 1)  ;; Backward branch to the inner loop
            )
          )
          (br 0)  ;; Backward branch to the outer loop (valid)
        )
      )
    )
  )
  "unknown label"
)