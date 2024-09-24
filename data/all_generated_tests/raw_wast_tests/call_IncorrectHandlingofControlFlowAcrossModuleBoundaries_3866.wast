;; 5. **Recursively Call Imported Function**:    Create a scenario where a module calls an imported function which in turn calls back into the module. This tests if control flow and stack states are preserved across nested calls. The wizard_engine’s explicit stack handling should ensure consistency, while the WebAssembly implementation might miss nuances.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
    (func $recursive_call_test
      (call $imported_func (call $recursive_call_test))
    )
  )
  "type mismatch"
)