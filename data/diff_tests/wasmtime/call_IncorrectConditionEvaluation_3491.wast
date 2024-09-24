;; **Test 10**: Call an imported function ensuring edge cases with partially initialized modules. Validate if incorrect condition evaluation causes module state inconsistencies or traps when referencing invalid function indices.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func (call 1))  ;; Attempting to call an invalid function index
  )
  "unknown function"
)