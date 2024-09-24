;; 4. **Test Description**: A `block` with a series of nested labels and a `br_if` that conditionally branches to the enclosing block label.    **Reasoning**: Verifies conditional branch resolution from nested labels to the correct outer block, ensuring proper label indexing.

(assert_invalid
  (module (func $nested-label-conditional-branch
    (block $outer (result i32)
      (i32.const 1)
      (block $inner
        (br_if 1 (i32.const 0))
      )
      (i32.const 2)
    )
    (drop)
  ))
  "type mismatch"
)