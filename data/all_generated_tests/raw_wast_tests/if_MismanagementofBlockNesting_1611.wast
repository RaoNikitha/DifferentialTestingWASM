;; 2. **Test for Mixed Single and Nested `if` with `else`**: Mix single `if` blocks with deeply nested `if-else` blocks to see if the `else` branches are properly associated with their correct `if` block and if the end labels are correctly managed.

(assert_invalid
  (module
    (func (result i32)
      (if (i32.const 1)
        (then
          (i32.const 2)
          (if (i32.const 0)
            (then (i32.const 3))
            (else (i32.const 4))
          )
        )
        (else
          (if (i32.const 1)
            (then (i32.const 5))
          )
        )
      )
    )
  )
  "type mismatch"
)