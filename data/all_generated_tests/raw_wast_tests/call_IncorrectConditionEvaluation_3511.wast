;; - Define an imported function and call it from within the module. Verify that both the import signature and the stack operations match the expected types and values and that condition evaluations properly reflect in branching decisions.

(assert_invalid
  (module
    (import "env" "ex_func" (func (param i32) (result i32)))
    (func $import_caller (call 0 (i64.const 10)))
  )
  "type mismatch"
)