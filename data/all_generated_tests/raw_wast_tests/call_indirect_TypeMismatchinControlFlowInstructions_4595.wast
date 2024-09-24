;; 4. Test a `call_indirect` instruction within an `if-else` block with the condition leading to two different function signatures, where one conforms and the other does not match the `typeidx`. This tests dynamic type checking consistency within conditional control flows.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i64)))
    (func $f (param i32))
    (func $g (param i64))
    (table funcref (elem $f $g))
    (func (param i32)
      (if (local.get 0)
        (then (call_indirect (type $sig1) (i32.const 0) (local.get 0)))
        (else (call_indirect (type $sig1) (i32.const 1) (i64.const 0)))
      )
    )
  )
  "type mismatch"
)