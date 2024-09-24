;; 2. **Test 2: Multiple `nop` Instructions Before `br_table` With Valid Index**    - Place multiple `nop` instructions before a `br_table` with a valid index to ensure the indexed branch operates correctly even with the presence of multiple `nop` instructions preceding it.    - Constraint: Confirm that the stack state remains unaffected by the `nop` instructions and `br_table` branches correctly.

 ;; (module
  (func (block (br_table 0 1 2) (nop) (nop) (nop)))
)