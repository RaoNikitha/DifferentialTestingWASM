;; 9. **Test with `nop` in a Nested Loop Structure:**    - Use `nop` inside nested loops to verify CFG accuracy in tracking nested control structures without skipping or mishandling iterations.    - **Constraint Tested:** Validates that nested loop executions are not affected by `nop`.

(assert_invalid
  (module (func $nested-loops
    (loop
      (block
        (loop
          (nop)
          (br 1)
        )
        (br 1)
      )
    )
  ))
  "invalid type"
)