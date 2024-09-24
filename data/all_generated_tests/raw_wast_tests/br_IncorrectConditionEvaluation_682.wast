;; 3. **Test Description:**    Evaluate a series of nested `if-else` structures where a `br_if` should only evaluate the condition from the innermost scope, but incorrect scope handling causes outer scope conditions to illegally influence the branch decision.

(assert_invalid
  (module (func
    (if (i32.const 1)
      (then
        (if (i32.const 1)
          (then (br_if 1 (i32.const 1)))
        )
      )
    )
  ))
  "unknown label"
)