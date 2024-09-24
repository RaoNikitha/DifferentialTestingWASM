;; 7. **Test Description**:     Design an `if` block in a depth of nested `if` statements, where the deepest `else` branch contains a `br_table` with an out-of-bounds index.    **Constraint**: Validates depth handling and proper error propagation for `br_table` in nested `if` structures.    **Edge Case Relation**: Ensures nested control flow structures maintain proper validation and error handling for `br_table`.

(assert_invalid
  (module
    (func $nested-if-br-table
      (if (result i32)
        (i32.const 1)
        (then
          (if (result i32)
            (i32.const 1)
            (then
              (if (result i32)
                (i32.const 1)
                (then
                   (if (result i32)
                     (i32.const 1)
                     (then
                       (if (result i32)
                         (i32.const 1)
                         (then (i32.const 42))
                         (else (br_table 2 (i32.const 1)))
                       )
                     )
                     (else (i32.const 1))
                   )
                )
                (else (i32.const 1))
              )
            )
            (else (i32.const 1))
          )
        )
        (else (i32.const 1))
      )
      (drop)
    )
  )
  "type mismatch"
)