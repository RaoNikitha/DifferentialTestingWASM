;; 6. Test `call_indirect` with the stack underflow condition in `br_table`, ensuring that both the operand handling and error reporting conform to the specification.

(assert_invalid
  (module
    (type (func (param i32)))
    (table (export "t") 1 funcref)
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)