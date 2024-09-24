;; - Test 8: Implement a loop that calls another function within each iteration. The called function should manipulate the stack. Ensure the main loop properly maintains its expected stack state after each call, detecting any mismanagement due to function returns.

(assert_invalid
  (module
    (func $callee (result i32)
      i32.const 42
    )
    (func $main
      (loop (result i32)
        call $callee
        drop
        br 0
      )
    )
  )
  "type mismatch"
)