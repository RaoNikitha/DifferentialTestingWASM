;; - **Test 2**: Implement a `br_table` within a nested loop setup, using an index that matches the boundary condition (exactly the highest index). Validate how each engine manages accurate branching at the boundary condition.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (block (result i32)
          (br_table 0 1 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)