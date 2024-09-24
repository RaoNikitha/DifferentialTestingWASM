;; - Design a test case where a complex sequence of conditional blocks and a final return within the deepest nested block should terminate the function. Test if the return correctly ends the function execution or if it shifts to another conditional block incorrectly.

(assert_invalid
  (module
    (func $nested-return (result i32)
      (block $outer
        (block $inner
          (if (i32.const 1)
            (then
              (return (i32.const 42))
            )
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)