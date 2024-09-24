;; 3. **Zero Targets**:    Test a `br_table` instruction with zero targets in the jump table, ensuring the implementation handles empty tables appropriately.

(assert_invalid
  (module
    (type (func))
    (table 0 funcref)
    (func $index-out-of-bounds
      (call_indirect (type 0) (i32.const 1))
    )
  )
  "undefined table index"
)