;; 1. Test a `br_table` instruction where the index is exactly at the upper boundary of the target table size, followed by an `unreachable` instruction. Verify that the trap occurs immediately in both implementations, ensuring correct index bound handling without error.

(assert_invalid
  (module (func (block (br_table 0 (i32.const 1)) (unreachable)))
  )
  "invalid"
)