;; Function containing a control flow where a `return` follows a series of nested conditionals (`if-else` blocks) to verify the return effectively exits the entire function, not just the innermost conditional block.

(assert_invalid
  (module
    (func $nested-if-return (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (if (result i32)
            (then
              (return (i32.const 42))
            )
          )
          (i32.const 0)
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)