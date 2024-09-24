;; 10. **Test 10**: Generate a situation where label indices and default labels in `br_table` are the same for different contexts, pushing operand values capable of highlighting condition evaluation errors in control flow and stack unwinding between both implementations.

(assert_invalid
  (module
    (func
      (block $outer
        (block $inner
          (br_table $inner $outer $outer (i32.const 1))
        )
      )
    )
  )
  "unknown label"
)