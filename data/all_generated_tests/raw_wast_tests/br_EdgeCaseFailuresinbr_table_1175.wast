;; 6. Create a test where a `br_table` instruction with a minimal valid index (typically zero) within a complex block structure confirms that the minimum index value is correctly handled without causing unintended jumps.

(assert_invalid
  (module (func (block (result i32) (br_table 0 (nop) (i32.const 1))) (drop)))
  "type mismatch"
)