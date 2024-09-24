;; 4. **Test Description**:    Stress-testing will be done using a `br_table` instruction within nested `block` structures, with `nop` instructions placed in various positions. This test will check if the branch table correctly maps branches, skipping `nop` instructions as expected.

(assert_invalid
  (module
    (func (block (br_table 0 0 (nop)) (block (nop) (br_table 0 0 (nop)))))))
  "type mismatch"
)