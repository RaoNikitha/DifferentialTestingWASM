;; 6. **Uninitialized Index Value**:    Execute `br_table` without initializing the index properly to test if the engine traps or handles uninitialized indices robustly.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $uninitialized-index
      (call_indirect (type 0) (nop))
    )
  )
  "type mismatch"
)