;; 6. **Test Description**: Test `if` with immediate `unreachable` followed by `br_table` in `else` that has one out-of-bound index but valid otherwise.    - **Constraint**: Ensure `if` properly traps on `unreachable` but does not mishandle the subsequent `br_table`.    - **Relation to Edge Case**: Distinguishes handling between valid and invalid references within control structures involving traps.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (unreachable)
        )
        (else
          (br_table 1 0 (i32.const 0) (i32.const 1))
        )
      )
    )
  )
  "unreachable instruction in if block"
)