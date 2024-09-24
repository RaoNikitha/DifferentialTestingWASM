;; 9. **Test 9: Loop with `nop` and External Branch**:    - **Description**: Construct a loop with `nop` inside and issue a branch (`br`) outside the loop. Verify the branch target resolution bypasses `nop` and exits the loop correctly.    - **Constraint**: Ensure the loop context properly handles `nop` without affecting the outer branch.    - **Relation to Incorrect Branch Target Resolution**: Validates that external branches bypass loops containing `nop` correctly.

(assert_invalid
  (module
    (func $loop-with-nop-and-br
      (loop (nop))
      (br 1)
      (nop)
    )
  )
  "invalid branch depth"
)