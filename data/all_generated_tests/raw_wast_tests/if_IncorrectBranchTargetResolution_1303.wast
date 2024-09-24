;; 4. **Test Mismatched End Labels in Multi-nested Blocks**:    Implement multiple levels of `if` and other blocks like `block` or `loop` and insert branches within the `if` block targeting various enclosing labels. Check that each branch correctly resolves to the intended enclosing block.

(assert_invalid
  (module
    (func $multi-nested-labels
      (block $outer
        (i32.const 0)
        (loop $middle
          (block $inner
            (if (result i32)
              (then
                (br $outer (i32.const 1)) ; This should target the outer block
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)