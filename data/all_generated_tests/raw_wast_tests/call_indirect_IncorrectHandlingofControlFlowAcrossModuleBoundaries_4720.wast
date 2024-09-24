;; Export a function with type `(f64) -> ()` from a module, import it into another module, and perform an indirect call with an incorrect argument type `(i64)`, observing whether the implementation traps correctly.

(assert_invalid
  (module
    (func $exported_func (param f64))
    (export "export_func" (func $exported_func))
  )
  "invalid export type"
)
(module
  (import "m" "export_func" (func $imported_func (param f64)))
  (type $sig (func (param i64)))
  (table 1 funcref)
  (elem (i32.const 0) $imported_func)
  (func
    (call_indirect (type $sig) (i32.const 0) (i64.const 0))
  )
)