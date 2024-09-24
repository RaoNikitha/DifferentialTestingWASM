;; 3. **Test Description**: Construct a conditional block (`if-else`) where the `if` block produces `i32` and `else` produces `i64`, and then use `br_table` to branch to target labels expecting uniform result types.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (if (result i32)
          (then
            (i32.const 0)
          )
          (else
            (i64.const 0)
          )
        )
        (br_table 0 1 (i32.const 1) (i32.const 0))
      )
    )
  )
  "type mismatch"
)