;; 7. **Test 7: Loop with Indirect Call to Imported Function**:    - A loop that includes an indirect call to an imported function based on a runtime-determined function table index.    - **Constraint Checked**: Validates the handling of control flow and stack across indirect calls within a loop.    - **Relevance**: Tests the robustness of control flow when indirect calls potentially dispatch to different imported functions.

(assert_invalid
  (module
    (import "env" "func" (func $imported_func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $imported_func)
    (func $test (result i32)
      (loop (result i32)
        (call_indirect (type (func (param i32) (result i32))) (i32.const 0))
      )
    )
  )
  "indirect call type mismatch"
)