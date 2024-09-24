;; 1. **Test 1 - Default Label Out of Bounds**:    Create a `br_table` instruction with the default label index set to an out-of-bounds label which does not exist in the context. This checks if the implementation correctly branches to the default label or raises an error for invalid CFG.

(assert_invalid
  (module (func $default-label-out-of-bounds
    (block (br_table 1 2 3 (i32.const 2)))
  ))
  "unknown label"
)