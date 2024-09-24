;; - Test an early return from a deeply nested block within a function. The expected behavior is to exit the function entirely and not merely terminate the nearest enclosing block or misdirect to an unintended target.

(assert_invalid
  (module
    (func (result i32)
      (block
        (block
          (block
            (return (i32.const 42))
            (unreachable)
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)