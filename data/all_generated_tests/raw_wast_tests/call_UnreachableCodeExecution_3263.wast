;; Test 2: Use a loop that calls a function, and within the loop, the function call wrongly sets the loop's continuation condition, leading to an 'unreachable' instruction outside the loop.

(assert_invalid
  (module
    (func $test-loop-call
      (loop
        (call $set-unreachable)
        (br_if 0 (i32.const 1))
      )
      unreachable
    )
    (func $set-unreachable (param i32))
  )
  "type mismatch"
)