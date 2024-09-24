;; 8. **Test 8: Nested Loop with Conditional Branching Backward**    - **Description:** A loop inside another loop where the inner loop contains a `br_if` that conditionally jumps back to the start of the outer loop.    - **Constraint Checked:** Proper handling of backward jumps and stack unwinding between nested loops.    - **Mismanagement Relation:** Ensuring that nested loops correctly handle conditional backward branches.

(assert_invalid
  (module
    (func $nested-loop-conditional-backward
      (loop $outer
        (loop $inner
          (i32.const 0)
          (i32.const 1)
          (br_if $outer)
        )
      )
    )
  )
  "type mismatch"
)