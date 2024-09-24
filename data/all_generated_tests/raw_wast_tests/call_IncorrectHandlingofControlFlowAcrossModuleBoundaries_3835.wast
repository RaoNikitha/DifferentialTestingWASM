;; 4. Construct a module that imports and exports multiple functions. Call these functions in sequence, mixing between imported and internal calls. This will test the accurate handling of sequential control flow transitions between module boundaries.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
    (func $internal_func1 (param i32) (result i32)
      (call $imported_func (i32.const 0))
    )
    (func $internal_func2 (param i32) (result i32)
      (call $internal_func1 (i32.const 1))
    )
    (func $caller_func (param i32) (result i32)
      (call $internal_func2 (i32.const 2))
    )
    (export "exported_func" (func $caller_func))
  )
  "type mismatch"
)