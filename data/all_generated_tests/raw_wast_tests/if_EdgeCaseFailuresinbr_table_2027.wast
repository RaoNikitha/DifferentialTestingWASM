;; 8. Examine an `if` statement where the `then` block executes a `br_table` with indices dependent on prior calculations within the `if`, challenging both implementations' handling of computed indices.

(assert_invalid
  (module
    (func $br_table_in_then_block
      (block
        (if (result i32)
          (then
            (i32.const 3)
            (br_table 1 0)
          )
          (else (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)