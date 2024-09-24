;; Test 8: Use `return` inside a call to another function, the outer function ends with `unreachable`. Reason: Assures `return` terminates the function call properly without passing control to `unreachable`.

(assert_invalid
  (module
    (func $inner (result i32)
      (i32.const 42)
      (return)
    )
    (func $outer
      (call $inner)
      (unreachable)
    )
  )
  "type mismatch"
)