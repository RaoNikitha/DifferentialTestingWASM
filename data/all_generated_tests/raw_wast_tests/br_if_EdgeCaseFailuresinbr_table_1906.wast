;; 7. **Test with Index Equal to Depth**:    Create a `br_table` instruction with an index exactly equal to the `ctl_stack` depth, testing if this edge condition is properly handled without off-by-one errors in label lookups.

(assert_invalid
  (module (block (br_if 1 (i32.const 1))))
  "unknown label"
)