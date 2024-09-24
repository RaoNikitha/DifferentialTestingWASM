;; 2. **Test Description:**    - Export a function from a module and import it in another. In the second module, use `call_indirect` with an index out of bounds to trap the call. This checks if the appropriate trap is produced, confirming robust index boundary validations at module boundaries.    - **Constraint:** Ensure correct trapping for out-of-bounds table indices.    - **Context:** Validates handling call indices across module boundaries with proper error trapping.    -

 ;; (module
  (type $t (func (param i32)))
  (import "mod" "func" (func $external (type $t)))
  (func $test (call_indirect (type $t) (i32.const 1)))
  (table funcref (elem $external))
  (export "test" (func $test))
)

(assert_invalid
  (module
    (type $t (func (param i32)))
    (import "mod" "func" (func $external (type $t)))
    (func $test (call_indirect (type $t) (i32.const 2)))
    (table funcref (elem $external))
    (export "test" (func $test))
  )
  "type mismatch"
)