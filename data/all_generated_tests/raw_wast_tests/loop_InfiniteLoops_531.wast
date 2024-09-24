;; 2. **Test Unconditional Branch Jumping Back Loop**:    Check a loop with an unconditional `br` to a label pointing to the start of the loop. Ensure that this causes an infinite loop by repeatedly jumping to the loop start.

(assert_invalid
  (module
    (func $unconditional-branch-loop
      (block
        (loop $L
          (br $L)
        )
      )
    )
  )
  "invalid jump to loop start"
)