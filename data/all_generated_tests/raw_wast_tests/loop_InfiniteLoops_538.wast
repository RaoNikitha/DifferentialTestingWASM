;; 9. **Test Incorrect Loop Initialization on Branch**:    Validate a loop where branching to it doesn't reinitialize the loop state properly, hence resulting in infinite loop conditions due to improper restarts.

(assert_invalid
  (module
    (func $loop-br-infinite
      (block
        (loop $l (result i32)
          (br $l)
        )
      )
    )
  )
  "infinite loop detection"
)