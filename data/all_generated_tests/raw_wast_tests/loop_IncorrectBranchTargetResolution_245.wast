;; 6. **Test 6: Forward-Facing Branch in Loop**    - Description: Insert a branch instruction at the beginning of a loop that targets an instruction located at the end of the loop sequence. Ensure that the loop correctly reaches the target and proceeds.    - Constraint: Checks the loop instruction’s forward branch target resolution and stack state.

(assert_invalid
  (module
    (func $forward-branch-loop
      (block $exit (br $exit) (unreachable))
      (loop (result i32)
        (br 1)
        (i32.const 1)
      )
      (unreachable)
    )
  )
  "type mismatch"
)