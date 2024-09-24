;; 6. Perform a `call_indirect` to an imported function that expects a complex parameter type (e.g., a nested structure) to ensure the type checking and parameter passing are correctly managed across modules.

(assert_invalid
 (module
   (import "env" "func" (func $importedFunc (param (struct (field i32) (field f64)))))
   (type (func (param (struct (field i32) (field f64)))))
   (table 1 funcref)
   (elem (i32.const 0) $importedFunc)
   (func (call_indirect (type 0) (i32.const 0)))
 )
 "type mismatch"
)