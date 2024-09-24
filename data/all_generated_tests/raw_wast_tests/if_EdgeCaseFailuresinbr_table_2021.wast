;; 2. Create an `if-else` structure where a `br_table` in the `else` block is given with an index that exceeds the number of branch targets by one, to verify if both implementations throw appropriate errors.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 0)
      (if (result i32)
        (then
          (i32.const 1)
        )
        (else
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "invalid br_table target"
)