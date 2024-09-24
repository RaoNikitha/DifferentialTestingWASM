;; 5. **Incorrect Function Signature**:    Construct a scenario where the table index points to a function with a different signature from what is expected by `typeidx`. The expected result would be a trap, leading to an `unreachable` call. This enforces the implementation’s validation of function signatures.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (type (func (param i32)))
    (func $f (param i32 i32))
    (table funcref (elem $f))
    (func $incorrect-sig-test
      (call_indirect (type 1) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)