;; 9. **Test Description:**    - Design a test with an outer loop and a nested loop where the inner loop has a condition-based `br` that should exit to the outer loop, verifying correct label lookup regardless of nesting depth.    - **Constraint:** This checks whether the `br` instruction correctly handles relative label lookup without causing infinite loops from depth misinterpretation.

(assert_invalid
  (module
    (func $nested-loop-br
      (loop $outer
        (block
          (loop $inner
            (br_if $outer (i32.const 1))
            (br $inner)
          )
        )
      )
    )
  )
  "unknown label"
)