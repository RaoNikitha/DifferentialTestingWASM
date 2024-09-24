;; 5. **Test Call with Overflown Stack**:    Push values to the stack exceeding its limit and then perform a call operation. This verifies the implementation's robustness in stack management and checks for control flow errors leading to `unreachable` instructions.

(assert_invalid
  (module
    (func $stack-overflow
      (local i32)
      (local.set 0 (i32.const 1))
      (local.set 0 (i32.const 2))
      (local.set 0 (i32.const 3))
      (local.set 0 (i32.const 4))
      (local.set 0 (i32.const 5))
      (local.set 0 (i32.const 6))
      (local.set 0 (i32.const 7))
      (local.set 0 (i32.const 8))
      (local.set 0 (i32.const 9))
      (local.set 0 (i32.const 10))
      (local.set 0 (i32.const 11))
      (local.set 0 (i32.const 12))
      (local.set 0 (i32.const 13))
      (local.set 0 (i32.const 14))
      (local.set 0 (i32.const 15))
      (local.set 0 (i32.const 16))
      (local.set 0 (i32.const 17))
      (local.set 0 (i32.const 18))
      (local.set 0 (i32.const 19))
      (local.set 0 (i32.const 20))
      (call 0)
    )
  )
  "stack overflow"
)