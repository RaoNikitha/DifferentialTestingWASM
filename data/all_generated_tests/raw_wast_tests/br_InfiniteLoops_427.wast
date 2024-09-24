;; 8. **Test Description:**    - Formulate a loop with multiple nested `block` and `loop` structures where multiple `br_if` instructions are involved. The condition should intermittently change to sometimes meet or fail, influencing loop execution.    - **Constraint:** This evaluates the `br_if` handling within nested structures and ensures the correct conditional jumps to avoid infinite looping due to improper branch operations.

(assert_invalid
  (module
    (func $nested-loop-br-if
      (block $outer
        (loop $inner
          (block $nested
            (br_if $outer (i32.const 0))
            (br_if $inner (i32.const 1))
            (br_if $nested (i32.const 0))
          )
        )
      )
    )
  )
  "unknown label"
)