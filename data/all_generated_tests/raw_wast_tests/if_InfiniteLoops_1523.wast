;; 4. **Multiple Branches in Loop:**    - Test Condition: Use multiple `if` instructions inside a loop, each condition leading to different `br_if` branches.    - Constraint: Checks if all branches correctly evaluate and manage stack and labels.    - Relevance: Tests complex control flows with multiple potential infinite loop paths.

(assert_invalid
  (module
    (func (result i32)
      (block $outer
        (loop $inner
          (if (result i32)
            (i32.const 1)
            (then
              (br_if $outer (i32.const 0))
              (br $inner)
            )
            (else
              (br_if $inner (i32.const 0))
              (br $outer)
            )
          )
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)