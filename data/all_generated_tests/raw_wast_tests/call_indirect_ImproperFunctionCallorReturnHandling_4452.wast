;; 1. **Test Description:** Create a WebAssembly module with a `call_indirect` instruction that uses an invalid table index to ensure it correctly traps when trying to invoke a function.    - **Constraint:** Verifies out-of-bounds table index handling and trapping.    - **Improper Handling Relation:** Incorrect table index access could bypass the intended function execution and result in unexpected control flow or crash.

(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $invalid-table-index (call_indirect (type 0) (i32.const 1)))
  )
  "unknown table"
)