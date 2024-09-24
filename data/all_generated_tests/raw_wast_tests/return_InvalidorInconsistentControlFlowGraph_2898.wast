;; 7. **Unused Return Value**:    Include a `return` in a function block where the returned value is not subsequently used.    - Tests operand stack handling and unwinding where return values are non-essential.

(assert_invalid
  (module
    (func $unused-return-value (result i32)
      (i32.const 10)
      (block
        (return (i32.const 20))
        (i32.const 30)
      )
    )
  )
  "type mismatch"
)