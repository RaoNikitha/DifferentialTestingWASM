;; 2. Design a loop with conditional branches (`br_if`) within it that target the loop itself. Verify if the condition correctly triggers the branch and restarts the loop from the beginning, as improper label handling could lead to incorrect target jumps.

(assert_invalid
  (module
    (func $loop_conditional_branch
      (loop (result i32)
        (i32.const 1)
        (br_if 0 (i32.const 0)) ; condition false, no branch
        (i32.const 2)
        (br_if 0 (i32.const 1)) ; condition true, branch to loop start
        (i32.const 3)          ; should not reach here because of the above branch
      )
    )
  )
  "type mismatch"
)