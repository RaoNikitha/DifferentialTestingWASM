;; - Test Case 9: Set up a loop with an early exit branch and place an `unreachable` immediately afterward. This tests that the branch correctly exits the loop without hitting the `unreachable`.

(assert_invalid
  (module (func $loop-with-early-exit
    (loop (result i32) (br 1) (unreachable) (i32.const 1))
  ))
  "type mismatch"
)