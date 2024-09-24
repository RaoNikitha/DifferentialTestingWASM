;; 9. Design a function call where the `call_indirect` function returns an unexpected number of results. Ensure that OCaml traps immediately during pattern matching due to a mismatch in expected return type and count whereas Java should fail at the `checkSignature` stage or result handling phase.

(assert_invalid
  (module
    (type (func (result i32)))
    (table 1 funcref)
    (func (result i64) (i64.const 42))
    (elem (i32.const 0) funcref 0)
    (func (result i32)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)