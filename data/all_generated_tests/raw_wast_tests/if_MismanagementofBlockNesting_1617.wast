;; 8. **Test for `else` Missing in Deeply Nested `if`**: Create a deeply nested `if` structure and omit the `else` for some blocks, ensuring that the correct termination with `end` still maintains valid control flow and operand stack management.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 0)
      (if (result i32)
        (i32.const 1)
        (if (result i32)
          (i32.const 2)
          (if (result i32)
            (i32.const 3)
          )
        )
      )
    )
  )
  "type mismatch"
)