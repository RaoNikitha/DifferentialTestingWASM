;; 3. **Test 3: `nop` Inside `block` And `br_table` Targeting Out-of-Bounds**    - Implement a `nop` inside a `block` that contains a `br_table` instruction targeting an out-of-bounds index to see if the `nop` within the control structure causes any behavioral changes.    - Constraint: Check that the `nop` does not alter the trap behavior of the `br_table` when accessing an invalid index.

(assert_invalid
  (module
    (func $test
      (block
        nop
        (br_table 0 1 2 3 (i32.const 4))
      )
    )
  )
  "br_table index out of bounds"
)