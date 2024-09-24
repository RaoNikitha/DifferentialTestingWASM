;; 7. **Test Description:**    - Establish a nested loop with a scenario where an outer loop and its nested loop each contain a `block`, and the nested loop uses `br` to exit the block to the outer loop under regularly tested conditions.    - **Constraint:** This test focuses on forward branching and proper stack management to prevent infinite loops from incorrect unwinding or branch misdirection.

(assert_invalid
  (module
    (func $nested-loop-blocks
      (block
        (loop
          (block
            (loop
              (br 3)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)