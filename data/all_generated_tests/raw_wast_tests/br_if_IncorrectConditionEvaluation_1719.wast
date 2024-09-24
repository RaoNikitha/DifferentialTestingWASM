;; 10. **Test Description**: Create a `br_if` inside a deeply nested `if`-`else` block with a true condition. Verify that the correct target block is exited, ensuring proper handling of deep nesting and correct condition evaluation.

(assert_invalid
  (module
    (func $deep-nested-if-else-br_if
      (block
        (block
          (if
            (i32.const 1)
            (then
              (block
                (if
                  (i32.const 1)
                  (then
                    (br_if 1 (i32.const 1))
                  )
                  (else)
                )
              )
            )
            (else)
          )
        )
      )
    )
  )
  "unknown label"
)