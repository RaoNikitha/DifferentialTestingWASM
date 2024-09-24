;; 6. **Test Description:**    - Export a function with side effects (e.g., printing or modifying memory) from a module. Import and invoke it using `call_indirect` in another module to ensure the side effects are correctly handled and observed in the calling module.    - **Constraint:** Validate side effect handling across module boundaries.    - **Context:** Ensures the correct execution of side effects when transitioning between modules using `call_indirect`.    -

 ;; (module
  (type $sig (func (param i32)))
  (import "env" "side_effect_func" (func (type $sig)))
  (table funcref (elem 0))
  (func (export "invoke")
    (i32.const 0)
    (call_indirect (type $sig) (i32.const 0))
  )
)