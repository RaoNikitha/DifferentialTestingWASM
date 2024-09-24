;; Test 1: Validate a call instruction within a loop that calls a function which recursively calls itself without a proper base case, testing the stack operations and type validation. Ensure that the function signature is correctly checked, and improper handling should result in an infinite loop.

(assert_invalid
  (module
    (func $recursive (param i32) (result i32)
      (local.get 0)
      (call $recursive)
    )
    (func $test_loop
      (loop 
        (call $recursive (i32.const 1))
      )
    )
  )
  "infinite recursion"
)