;; 10. **Test Description:**    - Integrate a complex nested loop with multiple branches where `br` instructions target both backward to the loop's beginning and forward to post loop execution. Include conditions that frequently change loop control.    - **Constraint:** This ensures the correct behavior of `br` in branching within and outside loop constructs, validating structured control flows and preventing infinite loops.

(assert_invalid
  (module
    (func $nested-loop-multiple-branches
      (loop $outer_loop
        (br_if $outer_loop (i32.const 1))
        (loop $inner_loop
          (br_if $outer_loop (i32.const 0))
          (block
            (br_if 1 (i32.const 1)) ;; Expected to branch to $inner_loop
          )
        )
      )
    )
  )
  "type mismatch"
)