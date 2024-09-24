;; 7. Construct a function with deep nesting of `if-else` statements where `return` should only be called based on specific conditions in the innermost blocks. Validate consistency in stack unwinding when conditions lead to different returns.

(assert_invalid
  (module
    (func $deep-nest-conditional-return (result i32)
      (i32.const 0)
      (if (result i32)
        (then
          (block
            (if (i32.const 1)
              (then
                (block
                  (if (i32.eqz (i32.const 0))
                    (then
                      (return)
                    )
                  )
                )
              )
            )
          )
        )
        (else
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)