;; 9. **Test Description**:     Create an `if` block where the condition is true and the `then` branch contains a full depth `br_table`, but includes an invalid index.    **Constraint**: Ensures index bounds are checked within `then` branches of `if` blocks.    **Edge Case Relation**: Verifies consistent boundary checks within the `then` control path for `br_table`.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        (then (br_table 0 1 (i32.const 1)))
        (else (unreachable))
      )
    )
  )
  "undefined table index"
)