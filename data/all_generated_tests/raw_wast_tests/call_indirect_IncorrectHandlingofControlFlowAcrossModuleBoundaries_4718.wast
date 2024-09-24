;; Export a function with type `() -> (i32)` from one module and import it into a second module. Create an indirect call setup with an expected type `() -> (i64)`, testing for crashes or traps due to return type mismatches.

(assert_invalid
  (module
    (type (func (result i64)))
    (import "mod" "func" (func $imported_func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $imported_func)
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)