;; 4. **Loop with Multiple Branch Instructions**:    - Description: Implement a loop containing several `br` and `br_if` instructions targeting different labels, including sibling loops. Validate that each branch targets the correct loop.    - Reasoning: Confirms accurate resolution of multiple branching instructions targeting different loops.

(assert_invalid
  (module
    (func $complex_loop_branches
      (loop $outer (result i32)
        (loop $inner (result i32)
          (br 1) 
          (br_if 0 (i32.const 1)) 
        )
        (br 1) 
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)