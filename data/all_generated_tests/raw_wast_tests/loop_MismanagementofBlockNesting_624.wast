;; 5. **Unwinding Stack with Conditional Branches**: Develop a nested loop with conditional branches (`br_if`) that depend on the stack values. This test checks if the stack is correctly unwound and operands are managed properly when branching to the loop’s start and correctly pushing operands back.

(assert_invalid
  (module
    (func $stack-unwind-conditional-branches
      (local i32)
      (block
        (loop
          (i32.const 0)
          (local.set 0)
          (br_if 1 (local.get 0))
          (i32.const 1)
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)