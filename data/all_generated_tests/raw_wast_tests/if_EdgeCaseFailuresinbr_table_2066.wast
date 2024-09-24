;; Create an `if` block where indices for `br_table` in the `then` branch are within bounds, while the `else` branch introduces labels referring to outer scopes improperly, causing undefined behavior differences.

(assert_invalid
  (module
    (func $test-invalid-br-table
      (if (result i32)
        (i32.const 1)
        (then
          (br_table 0 0 0)
        )
        (else
          (br 1)
        )
      )
    )
  )
  "invalid branch depth"
)