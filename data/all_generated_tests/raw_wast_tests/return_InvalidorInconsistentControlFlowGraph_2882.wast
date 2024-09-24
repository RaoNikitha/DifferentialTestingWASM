;; 1. **Test 1**: Create a function with multiple nested blocks where the `return` is incorrectly placed inside a deeper nested block instead of terminating an outer block. This tests if the `return` wrongly matches an inner block, leading to skipped intermediate code.

(assert_invalid
  (module
    (func $incorrect-nested-return (result i32)
      (block
        (block
          (i32.const 1)
          (return)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)