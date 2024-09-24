;; 8. **Test with `nop` in Function Call Leading to Conditional `br_if`**: Call a function that contains `nop` instructions and returns a value used in a `br_if` to decide a branch. Validate that the function's return value and subsequent branch are correct.

(assert_invalid
  (module
    (func $conditional-br_if
      (block
        (nop)
        (br_if 0 (i32.const 0))
      )
    )
  )
  "expected i32 type for br_if condition"
)