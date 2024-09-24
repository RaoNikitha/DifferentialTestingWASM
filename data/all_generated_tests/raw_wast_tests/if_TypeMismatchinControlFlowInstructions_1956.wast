;; 7. **Test Description**: Formulate a test with nested `if` instructions where the nested `if` block pushes a type (`i64`) not matching the outer block's expected type (`i32`).    - **Constraint Checked**: Strict nesting control to ensure inner blocks conform to outer block types.    - **Expected Behavior**: Validators should trap if the nested flow violates outer type expectations.

(assert_invalid
  (module (func $nested-if-type-mismatch (result i32)
    (if (result i32) (i32.const 1)
      (then
        (if (result i64) (i32.const 1)
          (then (i64.const 42))
          (else (i64.const 42))
        )
        (i32.const 1)
      )
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)