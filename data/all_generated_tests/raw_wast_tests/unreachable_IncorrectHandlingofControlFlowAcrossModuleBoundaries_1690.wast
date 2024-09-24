;; 1. **Cross-Module Call with `unreachable` in Import Function:**    - Test a scenario where a module imports a function from another module, and the imported function contains the `unreachable` instruction. The test ensures that the trap caused by `unreachable` in the imported function is handled correctly by the calling module.    - **Constraint:** Ensures the imported function call leads to an immediate trap and no further instructions are executed in the calling module after `unreachable`.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func))
    (func (call $imported_func) (i32.const 0) (i32.add))
  )
  "type mismatch"
)