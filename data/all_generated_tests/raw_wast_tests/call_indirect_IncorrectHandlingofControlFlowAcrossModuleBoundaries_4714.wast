;; Define a function within a module with signature `(i32, i64) -> (i32)`, export this function, and then import it into a second module. Perform an indirect call with insufficient stack operands, expecting stack underflow to be handled correctly.

(assert_invalid
  (module
    (type $func_type (func (param i32 i64) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (type $func_type) (i32.const 0) (i64.const 1))
    (func
      (call_indirect (type $func_type) (i32.const 0) (i32.const 42))
    )
  )
  "stack underflow"
)