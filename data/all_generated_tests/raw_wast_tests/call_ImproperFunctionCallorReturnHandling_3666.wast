;; 5. Create a function call sequence where intermediate function calls consume arguments but return incorrect results, checking if the return stack is maintained correctly.

(assert_invalid
  (module
    (func $incorrect-return (param i32) (result i64) (i64.const 0))
    (func $call-func (call 0 (i32.const 1)) (drop))
  )
  "type mismatch"
)