;; 4. **Test Description:**    - Construct a module exporting a function that modifies global variables. Import this function into another module and invoke it using `call_indirect`. Ensure that the correct global variable modifications are observed, testing stack and state continuity across module boundaries.    - **Constraint:** Check for state preservation and continuity across module boundaries.    - **Context:** Verifies that state changes in one module reflect correctly when called indirectly from another module.    -

 ;; (module
  (type (func (param i32) (result i32)))
  (import "mod" "func" (func $imported_func (param i32) (result i32)))
  (table 1 funcref)
  (elem (i32.const 0) $imported_func)
  (func $caller (param i32) (result i32)
    (call_indirect (type 0) (local.get 0))
  )
  (global $glob (mut i32) (i32.const 0))
  (func $modify_global (param i32)
    (global.set $glob (local.get 0))
  )
  (export "modify_global" (func $modify_global))
  (export "call" (func $caller))
)

(assert_invalid
  (module
    (import "mod" "modified_module" (func $external_func (param i32) (result i32)))
    (import "mod" "external_global" (global $ext_glob (mut i32)))
    (global $test_glob (mut i32) (i32.const 10))
    (table 1 funcref)
    (elem (i32.const 0) $external_func)
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "state continuity across module boundaries"
)