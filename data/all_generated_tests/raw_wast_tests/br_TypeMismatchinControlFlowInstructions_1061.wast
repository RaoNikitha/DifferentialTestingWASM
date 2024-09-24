;; 2. **Test for Type Mismatch for Loop Continuation:**    Define a loop expecting no parameters and use `br` inside the loop with an `i32` value on the stack. The test ensures that the implementation detects type mismatches for backward branches in loops.

(assert_invalid
  (module
    (func
      (loop
        (br 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)