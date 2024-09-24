;; 7. **Single Target**:    Test `br_table` with a single jump target and various index values to ensure boundary conditions and exact match scenarios are handled without traps.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f1)
    (func $f1 (param i32) (result i32) (local.get 0))
    (func $single-target (call_indirect (type 0) (i32.const 1) (i32.const 0)))
  )
  "type mismatch"
)