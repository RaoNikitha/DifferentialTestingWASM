;; 9. **Test Multiple Branches in Loop**: A loop containing both `br` and `br_if` branches in a series where different values on the stack should cause different branches to be taken. Validate correct branching to avoid infinite looping.

(assert_invalid
  (module (func $test-loop-multi-branch
    (block
      (loop $l1 (result i32)
        (br 0)
        (br_if 1 (i32.const 1))
        (i32.const 0)
      )
      (drop)
    )
  ))
  "type mismatch"
)