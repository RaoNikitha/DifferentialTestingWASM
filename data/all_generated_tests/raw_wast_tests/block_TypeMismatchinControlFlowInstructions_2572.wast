;; 3. **Test Description**:    Design a `block` with nested `block`s where the inner block wrongly assumes a different result type. Example: outer block expects `i32`, but inner block produces `i64`. Observe error handling.    **Constraint**: Nested block's result type should align with the outer block's type expectations.    **Relation**: Ensures nested control flow maintains consistent types.

(assert_invalid
  (module
    (func $test-block-nested-type-mismatch (result i32)
      (block (result i32)
        (block (result i64)
          (i64.const 42)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)