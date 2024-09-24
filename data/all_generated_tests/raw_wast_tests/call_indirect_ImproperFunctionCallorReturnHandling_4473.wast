;; 2. Prepare a scenario where the function type `typeidx` is missing from the type section, leading to an invalid `call_indirect` operation. Test that OCaml traps during type extraction (pattern matching failure) whereas Java encounters issues when invoking `checkSignature` due to a null reference.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $func (param i32) (result i32)
      (call_indirect (type 1) (i32.const 0) (i32.const 0))
    )
  )
  "type 1 not found"
)