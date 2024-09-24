;; - **Test 9**: Create a loop that performs recursive function calls. Tests should include deep recursion, stressing the stack's limit and observing how loop reinitialization affects the stack's depth and integrity. Ensure that the stack unwinding upon branching back into loops correctly resets to expected states.

(assert_invalid
  (module 
    (func $deep-recursion
      (result i32)
      (i32.const 10) 
      (loop $outer (result i32) 
        (i32.const 5) 
        (call $deep-recursion) 
        (i32.add) 
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)