;; Define a block that includes a `call_indirect` to an expected function signature but provides an incorrect number of arguments. The test verifies how both implementations handle stack adjustments for indirect calls with mismatched arguments.

(assert_invalid
  (module (type $t (func (param i32) (result i32)))
    (table 1 funcref)
    (func (result i32)
      (block (result i32)
        (call_indirect (type $t) (i32.const 0))
      )
    )
  )
  "type mismatch"
)