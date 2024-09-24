;; 3. **Test Description**: Implement a loop containing multiple nested loops and a `br_if` instruction that references an outer loop. This will test cross-nested `br_if` instructions to verify correct label reference.    - **Constraint Checked**: Label referencing in deeply nested loops.    - **Relation to Infinite Loops**: Incorrectly referencing an outer loop label will fail to break out of the loop, leading to an infinite loop.

(assert_invalid
  (module
    (func $cross-nested-loop-labels
      (block
        (loop $outer
          (loop $inner
            (br_if 1 (i32.const 1))
          )
        )
      )
    )
  )
  "unknown label"
)