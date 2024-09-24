;; 9. **Deeply Nested Conditionals with Unreachable:**    - Formulate deeply nested `if` conditionals where `unreachable` is inside the innermost conditional. This ensures that all outer conditional blocks correctly halt execution when `unreachable` in the inner conditional is encountered.

(assert_invalid
  (module (func $deeply_nested_conditional (result i32)
    (block (result i32)
      (if (i32.const 1)
        (then
          (if (i32.const 1)
            (then
              (if (i32.const 1)
                (then
                  (if (i32.const 1)
                    (then
                      (if (i32.const 1)
                        (then
                          (unreachable)
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  ))
  "type mismatch"
)