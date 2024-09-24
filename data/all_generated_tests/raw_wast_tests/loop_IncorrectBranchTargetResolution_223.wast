;; 4. **Test with Unreachable Code Post `br`**:    Implement a loop with a `br` that should skip over some instructions and enter the next loop, ensuring that it jumps correctly and the skipped instructions are never executed. This verifies that branches to subsequent blocks are correctly resolved.

(assert_invalid
  (module
    (func $unreachable_code_post_br
      (block $block1
        (loop $loop1
          (block $block2
            (br $block1)
            (unreachable)
          )
          (br $loop1)
          (unreachable)
        )
      )
    )
  )
  "unreachable code"
)