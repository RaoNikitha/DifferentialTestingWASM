;; 4. **Loop With Early Return and Unreachable**:    - Write a loop containing a `return` inside the loop but followed by `unreachable` statements after the loop.    - This checks if loops are correctly exited by `return` and prevent continuation to the `unreachable` portion.

(assert_invalid
  (module
    (func $loop-with-return-and-unreachable (result i32)
      (loop (return))
      (unreachable)
    )
  )
  "type mismatch"
)