;; 5. **Test Description:**    - Create a module exporting a function raising a trap (e.g., division by zero). Import and invoke this function indirectly using `call_indirect` in another module. Ensure proper propagation of traps and state rollback in the calling module.    - **Constraint:** Validate trap propagation and state consistency.    - **Context:** Ensures that traps in callee modules propagate correctly when using `call_indirect`.    -

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (import "env" "trap_func" (func $trap_func (type 0)))
    (table funcref (elem $trap_func))
    (func $test
      (call_indirect (type 0) (i32.const 0) (i32.const 10))
    )
  )
  "call_indirect trap propagation"
)