;; 10. **Nested `call_indirect` with `br_table`**:     Develop a nested test where an indirect function call leads to a `br_table` instruction, which then performs another indirect function call. This evaluates how both instructions interact, especially when edge cases are introduced in both calls (e.g., out of bounds or invalid types). This simulates real-world scenarios where complex control flows might reveal hidden discrepancies.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32)))
    (table 2 funcref)
    (elem (i32.const 0) $callee)
    (func $callee (param i32) (result i32)
      (br_table 0 1 (local.get 0))
      (i32.const 42)
    )
    (func $caller (param i32) (result i32)
      (call_indirect (type $sig1) (local.get 0))
    )
    (func (result i32)
      (call_indirect (type $sig2) (i32.const 0))
    )
  )
  "type mismatch"
)