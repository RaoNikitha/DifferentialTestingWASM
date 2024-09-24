;; 3. **Test Description**: Implement a deeply nested combination of `if` and `block` structures with varying stack operations inside each block. Insert `br` instructions to different labels and compare the stack state to check if differential handling leads to stack corruption.

(assert_invalid
  (module
    (func $nested-branch-stack-test
      (block $outer
        (block $inner
          (i32.const 1)
          (i32.const 2)
          (if $cond
            (then
              (block
                (br $outer)
              )
            )
          )
          (i32.add)
        )
        (i32.const 3)
      )
    )
  )
  "stack mismatch"
)