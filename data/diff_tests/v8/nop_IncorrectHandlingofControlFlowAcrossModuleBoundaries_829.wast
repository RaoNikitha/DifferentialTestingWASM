;; 10. **Test 10: `nop` in Indirect Call Setup through Exported Function**    - Place a `nop` before setting up an indirect call via an exported function.    - Validate that the setup, indirect call execution, and return path remain consistent, with `nop` having no effect on the operations.

(assert_malformed
  (module
    (type $t0 (func))
    (table $T0 1 funcref)
    (elem (i32.const 0) func $f1)
    (func $f1 (result i32)
      (i32.const 42))
    (func $f2 (result i32)
      (nop)
      (call_indirect (type $t0) (i32.const 0)))
    (export "test" (func $f2))
  )
  "type mismatch"
)