;; 1. Import a function from another module with signature `(i32, f64) -> (i64)` and then call it indirectly using a table from the importing module with a mismatched signature `(f32) -> (i64)`. The test checks for proper dynamic type checking and trapping behavior.

(assert_invalid
  (module
    (type (func (param i32 f64) (result i64)))
    (import "env" "imported_func" (func $imported_func (type 0)))
    (table 1 funcref)
    (elem (i32.const 0) $imported_func)
    (type (func (param f32) (result i64)))
    (func (call_indirect (type 1) (f32.const 0.0) (i32.const 0)))
  )
  "type mismatch"
)