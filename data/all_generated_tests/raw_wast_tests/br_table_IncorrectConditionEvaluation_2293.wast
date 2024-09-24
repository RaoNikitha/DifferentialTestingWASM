;; Test 3: Use `br_table` within an `if` block where the condition for `br_if` is alternately true and false, testing if the label indices referenced by the `br_table` are interpreted correctly in both implementations. The test monitors branching logic consistency under conditional execution.

(assert_invalid
  (module
    (func (param i32)
      (block
        (if (local.get 0)
          (then
            (br_table 0 0 (i32.const 0))
          )
          (else
            (br_table 0 0 (i32.const 1))
          )
        )
      )
    )
  )
  "validation error"
)