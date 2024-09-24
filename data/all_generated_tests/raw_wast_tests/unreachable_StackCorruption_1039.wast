;; 10. Test Description: Use a series of nested function calls where the innermost function includes `unreachable`. Check the stack to ensure proper unwinding, ensuring no stack corruption occurs in multi-level nested execution environments.

(assert_invalid
  (module
    (func $inner (unreachable))
    (func $middle (call $inner))
    (func $outer (call $middle))
  )
  "function stack unwinding with unreachable"
)