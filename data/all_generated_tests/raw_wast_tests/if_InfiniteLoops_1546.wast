;; 7. **Test Description**: Implement a `loop` containing conditional `if` blocks that include `unreachable` instructions in their branches, ensuring proper stack unwinding and error handling as prescribed.    **Constraint Checked**: Ensures correct error handling mechanism (`unreachable`), stack unwinding, and block termination.    **Relation to Infinite Loops**: If `unreachable` isn't handled correctly, it may not terminate execution, causing the loop to run indefinitely.

(assert_invalid
  (module
    (func $test
      (loop $loop
        (i32.const 1)
        (if (result i32)
          (then
            (unreachable)
          )
          (else
            (i32.const 2)
            (unreachable)
          )
        )
        br $loop
      )
    )
  )
  "unreachable executed"
)