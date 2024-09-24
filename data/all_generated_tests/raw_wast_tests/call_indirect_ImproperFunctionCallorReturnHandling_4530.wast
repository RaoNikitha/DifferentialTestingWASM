;; 9. **Table Reassignment Handling**: Test with a scenario where the function table is mutated before a `call_indirect`. The instruction should correctly refer to the updated table state and validate calls accordingly.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param f64)))
    (func $f (param i32))
    (table 1 funcref (elem $f))
    (func $reassign-table
      (table.init 0 (i32.const 0) (ref.null func) (i32.const 1))
      (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)