;; 5. **Test with Empty Functions**    - Write a test with empty functions or functions that have no operations other than a return.    - Ensure that the return instruction handles and doesn't misinterpret empty stack states.    - Relates to handling stack-empty conditions and stack-polymorphism, ensuring no false-positive or false-negative unwinding.

(assert_invalid
  (module
    (func $empty-function (return))
  )
  "type mismatch"
)