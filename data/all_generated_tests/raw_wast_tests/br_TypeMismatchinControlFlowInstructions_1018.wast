;; Test 9: Create a loop expecting an i32 result. Implement a br instruction that prematurely exits the loop, bypassing the correct stack unwinding and leaving an f64 type on the stack.

(assert_invalid
  (module
    (func $test
      (loop (result i32)
        (f64.const 0.0) (br 0)
      )
      (i32.const 1) (drop)
    )
  )
  "type mismatch"
)