;; 4. **Nested `br_table` with Conditional Initialization**:    - Develop a test with a nested `if-else` structure, where the inner `if` contains a `br_table` that references forward to labels defined outside the `if` block. Different handling of label initialization could lead to divergence in behavior between the two implementations.

(assert_invalid
  (module (func $nested_br_table
    (block $outer (result i32)
      (if (result i32) (i32.const 1)
        (then
          (block $inner
            (if (i32.const 1)
              (then
                (br_table $outer $inner (i32.const 0))
              )
            )
          )
        )
        (else
          (i32.const 2)
        )
      )
    )
  ))
  "type mismatch"
)