;; 2. Validate `call_indirect` for an imported table where the expected type does not conform to the function's type. This ensures that type conformity errors are correctly trapped across module boundaries, and alignment of types is strictly enforced.

(assert_invalid
  (module
    (import "env" "table" (table 1 funcref))
    (type $sig (func (param i32) (result i32)))
    (func $f (param i64) (result f64))
    (elem (i32.const 0) $f)
    (func $type-mismatch-imported-table
      (call_indirect (type $sig) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)