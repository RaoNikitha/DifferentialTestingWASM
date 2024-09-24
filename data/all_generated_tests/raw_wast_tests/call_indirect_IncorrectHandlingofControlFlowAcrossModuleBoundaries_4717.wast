;; Define a function in a module with type `(i64, i64) -> ()`, export it, and import it in another module. Make an indirect call with a `funcref` type mismatch, ensuring trapping and type checking are consistent across module boundaries.

(assert_invalid
  (module
    (type $sig1 (func (param i64 i64)))
    (type $sig2 (func (param i32)))
    (func $f (type $sig1))
    (table funcref (elem $f))
    (func $test
      (i32.const 0)
      (call_indirect (type $sig2) (i32.const 0))
    )
  )
  "type mismatch"
)