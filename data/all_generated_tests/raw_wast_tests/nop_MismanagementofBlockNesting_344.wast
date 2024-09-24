;; 5. **Test Nop with Br Table within Nested Blocks**: Design a function with a `br_table` instruction inside nested blocks and insert `nop` instructions before and after the `br_table`. This ensures the branch table correctly interprets nested depths without the `nop` affecting the calculated depth.

(assert_invalid
  (module
    (func (block (block (br_table 0 0) (nop) (nop))))
  )
  "br_table targets out of range"
)