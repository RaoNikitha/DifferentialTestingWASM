;; 3. **Mismatched Function Signature for Indirect Call in If-Else**:    - Description: Use an `if-else` construct with an expected result type of `i32` and call a function indirectly within both branches. Provide an index for a function that returns an `i64`, leading to a type mismatch.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (result i64)))
    (table 1 funcref)
    (elem (i32.const 0) $fn-returning-i64)
    (func $fn-returning-i64 (type 1) (i64.const 42))
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (call_indirect (type 0) (i32.const 0))
        )
        (else
          (call_indirect (type 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)