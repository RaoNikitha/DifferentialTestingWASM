;; 7. Create a test case where an `if-else` structure within a WebAssembly function calls `call_indirect` and uses `br` to exit out of different branches. Check for differential behavior where the branch target is incorrect due to mismatched function signatures.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i64)))
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func (result i64)
      (if (result i64) (i32.const 1)
        (then
          (call_indirect (type 1) (i32.const 0) (i64.const 10))
        )
        (else
          (br 0 (call_indirect (type 0) (i32.const 0) (i32.const 20)))
        )
      )
    )
    (func (param i32))
  )
  "type mismatch"
)