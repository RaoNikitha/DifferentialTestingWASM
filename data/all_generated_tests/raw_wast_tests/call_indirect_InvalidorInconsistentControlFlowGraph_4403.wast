;; **Test 2**: Construct a module that has an indirect function call but uses a table index that is valid but contains references to data types instead of functions. This will test how each implementation handles type mismatches in the table and how these cases cause invalid branches or loops in the CFG.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f64) (result i32)))
    (table 2 funcref (elem func 1))
    (func (result i32)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)