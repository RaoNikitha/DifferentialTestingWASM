;; **Test 6**: Test a function call where the signature does not match exactly due to type mismatches in the intermediate operations. Analyze the error or trap generated and verify if the type checking fails correctly.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $type-mismatch (param f64) (call 0 (local.get 0)))
  )
  "type mismatch"
)