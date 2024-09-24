;; 4. Create a module with a `br_table` instruction where the index is just within bounds, immediately after several `nop` instructions. Ensure the `nop` instructions do not affect the proper control flow and boundary checking at the edge of available targets.

(assert_invalid
  (module
    (func (block (loop (br_table 0) (nop)))))
  "br_table branch index out of bounds"
)