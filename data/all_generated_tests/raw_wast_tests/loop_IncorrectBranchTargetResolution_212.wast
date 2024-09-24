;; 3. **Test Input: Conditional Branch Misidentification**    - Description: Test a `br_if` instruction conditioned on a non-zero stack top, branching incorrectly from an inner loop to an unrelated block.    - Constraint: Check that conditional branches correctly resolve and do not misidentify targets.    - Focus: Evaluate the proper execution of conditional branches and their interaction with nesting.

(assert_invalid
  (module
    (func $conditional-branch-misidentification
      (loop $outer (result i32)
        (i32.const 0)
        (loop $inner (result i32 i32)
          (i32.const 1)
          (br_if $outer (i32.const 1))  ;; Incorrectly branches from inner loop to outer loop
        )
      )
    )
  )
  "type mismatch"
)