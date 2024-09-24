;; **Test Descriptions:**  1. Test the call instruction by creating a module that imports a function and calls it with a set of arguments that exceed what the imported function expects. This test checks whether the function reference and signature are correctly handled in both implementations, especially when transitioning control flow across module boundaries where the imported function's stack may be managed differently.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32)))
    (func $test_call
      (call $imported_func (i32.const 1) (i32.const 2))
    )
  )
  "type mismatch"
)