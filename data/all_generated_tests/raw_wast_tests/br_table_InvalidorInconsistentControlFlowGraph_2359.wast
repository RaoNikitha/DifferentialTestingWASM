;; 9. **Test 9 - Unreachable Code Due to Operand Out of Bounds**:    Set up a `br_table` where the operand is always out of bounds, causing the CFG to incorrectly mark certain branches as unreachable when they should be reachable. This tests the correct handling of out-of-bounds operand for CFG.

(assert_invalid
 (module 
  (func $unreachable (block (block (br_table 0 0 2 (i32.const 10))))
 )
) 
"unknown label"
)