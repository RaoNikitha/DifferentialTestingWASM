;; 2. **Test 2: `unreachable` After a Call to an Exported Function**    - Description: Create a main module that calls an exported function from another module. Ensure the exported function finishes execution, and upon returning control to the main module, the next instruction is `unreachable`.    - Constraint Checked: Verifies that control flow returning from an exported function back to the main module handles traps correctly.    - Relation: Checks for proper management of the execution stack when crossing module boundaries and encountering `unreachable`.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (export "main")
      (call $external_func)
      (unreachable)
    )
  )
  "unreachable instruction after call to imported function"
)