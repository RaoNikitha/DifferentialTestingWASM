;; 7. **Mutual Recursion Across Modules**:    Implement mutually recursive functions distributed across two modules. This test verifies if stack integrity is maintained when transitioning between modules many times. The wizard_engine should properly manage stack depth, while the WebAssembly implementation might face discrepancies.

(assert_invalid
  (module
    (import "env" "modA_func" (func $modA_func))
    (import "env" "modB_func" (func $modB_func))
    (func $modA_entry
      (call $modB_func)
    )
    (table funcref (elem $modA_func))
    (func $modB_entry
      (call_indirect (type 0) (i32.const 0))
    )
    (type (func))
  )
  "stack overflow"
)