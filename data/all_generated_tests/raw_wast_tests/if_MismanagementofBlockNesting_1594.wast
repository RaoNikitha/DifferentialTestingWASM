;; 5. **Loop Inside `if` With `br_if`**: Implement an `if` block containing a nested `loop` and a `br_if` inside the loop referring to the `if` block's label. This will test correct label assignment in the nested context.

(assert_invalid
  (module
    (func
      (i32.const 0)
      (if (result i32)
        (then
          (loop
            (br_if 1 (i32.const 1))
          )
          (i32.const 0)
        )
        (else
          (i32.const 1)
        )
      )
    )
  )
  "invalid branch target"
)