;; Test a function call that performs a pop operation on an already empty stack. This checks for proper error handling of stack underflow and validates the correctness of stack state management.

(assert_invalid
  (module
    (func $pop-on-empty-stack (call 0))
    (func)
  )
  "stack underflow"
)