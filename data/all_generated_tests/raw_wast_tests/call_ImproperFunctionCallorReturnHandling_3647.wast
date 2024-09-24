;; 6. **Test Description**: Initiate nested function calls where inner functions have mismatched return values compared to the expected types, to check stack preservation and restoration.

(assert_invalid
  (module
    (func $inner (result f64) (f64.const 42.0))
    (func $outer
      (call $inner) ;; expecting f64 but push results to i32
      (i32.eqz)
    )
  )
  "type mismatch"
)