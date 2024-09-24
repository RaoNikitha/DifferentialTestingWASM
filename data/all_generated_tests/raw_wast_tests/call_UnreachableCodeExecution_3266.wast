;; Test 5: Implement a recursive function that reaches its maximum recursion depth, causing an 'unreachable' instruction when the depth is exceeded.

(assert_invalid
  (module
    (func $recursive (param i32)
      (local.get 0)
      (i32.const 1)
      (i32.add)
      (call $recursive)
    )
    (func (export "start")
      (i32.const 0)
      (call $recursive)
    )
  )
  "unreachable code should cause trap"
)