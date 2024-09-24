;; 9. Construct a `br_table` with multiple branching to labels where each label contains conditional `call` instructions followed by `return` based on operand values. Ensure correct handling of condition testing, calls, and returns.

(assert_invalid
  (module
    (func $conditional_calls_with_return
      (block $outer
        (block $inner1
          (block $inner2
            (br_table $inner1 $inner2 $outer (i32.const 2))
            (i32.const 0)
          )
          (if (i32.eq (i32.const 1) (i32.const 0))
            (then (call $dummy_func) (return))
          )
        )
        (if (i32.eq (i32.const 2) (i32.const 0))
          (then (call $dummy_func) (return))
        )
      )
    )
    (func $dummy_func)
  )
  "type mismatch"
)