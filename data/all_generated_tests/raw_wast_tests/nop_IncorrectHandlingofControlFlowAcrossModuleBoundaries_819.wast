;; 10. **Test Description**: Design a test in which Module A exports a function containing loops with `nop` instructions inside the loop body. Module B imports and calls this function. Verify that `nop` instructions do not lead to incorrect loop iteration or premature loop termination when control transitions between modules.

(assert_invalid
  (module
    (func $exported_func (export "exported_func") (loop $loop (nop) (br $loop)))
    (import "env" "imported_func" (func $imported_func))
    (func (call $exported_func) (call $imported_func))
  )
  "type mismatch"
)