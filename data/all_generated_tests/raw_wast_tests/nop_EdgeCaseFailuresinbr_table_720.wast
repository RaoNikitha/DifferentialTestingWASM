;; 1. **Test 1: Single `nop` Before `br_table` With Out-of-Bounds Index**    - Insert a single `nop` instruction right before a `br_table` that branches to an index out of bounds. This test checks if the `nop` instruction causes any unexpected behavior in handling the out-of-bounds index in the `br_table` instruction.    - Constraint: Verify that the `nop` does not affect the handling of the invalid index, and the `br_table` behaves as expected (triggering a trap).

(assert_invalid
  (module
    (func $br_table_oob
      block
        (nop)
        (br_table 0 1 2 3
          (i32.const 5))
      end))
  "unknown label"
)