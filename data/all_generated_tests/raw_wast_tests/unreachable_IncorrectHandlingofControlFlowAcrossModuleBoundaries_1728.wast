;; 9. Develop a WebAssembly module (`Module A`) exporting a function chain ending with an `unreachable`, involving multiple imported function calls. Import this module into another module (`Module B`) and call the chain. Verify if `Module B` traps immediately once `unreachable` is executed, without any unintended continuation of instructions in the calling module.

 ;; (module
  (import "ModuleB" "imported_func" (func))
  (func (export "unreachable_chain")
    (call 0)
    (call 0)
    unreachable)
)

(assert_invalid
  (module (import "ModuleA" "unreachable_chain" (func))
    (func (call 0) (nop))
  )
  "type mismatch"
)