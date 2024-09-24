;; 5. Construct an edge case where the `call_indirect` references a function with a complex return type that has multiple return values, and provide arguments that don't match the expected types. This should cause OCaml to trap on incorrect pattern matching, whereas Java might fail while pushing return values due to incorrect handling in `checkSignature`.

(assert_invalid
  (module
    (type $complex (func (param i32 i32) (result f64 i32)))
    (table 0 funcref)
    (func $complex-return-mismatch
      (call_indirect (type $complex) (f64.const 1.1) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)