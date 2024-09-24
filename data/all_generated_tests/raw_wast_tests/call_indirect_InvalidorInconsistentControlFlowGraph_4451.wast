;; 10. **Test Description**:     - Implement a WebAssembly module with a sequence of `call_indirect` instructions where each subsequent call references a different table index, ultimately resolving to an invalid index.     - **Constraint**: Sequential resolution and validation of table indices and corresponding trap conditions.     - **CFG Relation**: CFG must maintain and correctly update state across multiple indirect calls, ensuring invalid indices lead to traps through correct control path management.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $test-sequential-calls
      (call_indirect (type 0) (i32.const 0))
      (call_indirect (type 0) (i32.const 1))
      (call_indirect (type 0) (i32.const 2))
    )
  )
  "index out of bounds"
)