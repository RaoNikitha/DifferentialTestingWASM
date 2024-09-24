;; 10. **Test Description**: Perform a function call inside a block that contains a sequence of branches (`br`) targeting different labels. Check if the labels resolve correctly post-call.    - **Constraint**: Tests the resolution of sequential branch targets within a block containing function calls.

(assert_invalid
  (module
    (func $target (param i32) (result i32)
      (local.get 0)
    )
    (func $test
      (block
        (br 1)
        (block
          (call $target (i32.const 42))
          (br 0)
        )
        (i32.const 0)
        (return)
      )
    )
  )
  "type mismatch"
)