;; 8. **Unwinding Error to Unreachable**:    - Here, a block consumes more operands than the stack provides, ending the sequence with `unreachable`.    - Ensures proper stack unwinding and stack height validations.    - Incorrect stack operation triggers execution of `unreachable`.

(assert_invalid
  (module (func $unwinding-error-to-unreachable
    (block (result i32)
      (i32.const 1)
      (i32.const 2)
      (drop)
      (drop)
      (drop)
    )
    unreachable
  ))
  "type mismatch"
)