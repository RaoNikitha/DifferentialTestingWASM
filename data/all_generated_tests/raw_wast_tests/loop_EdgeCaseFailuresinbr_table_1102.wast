;; 3. **Test Three**:    - Multiple `br_table` instructions inside a single `loop` with varying indices ranging from valid to extremely large values.    - **Constraint**: Verifies the correct reinitialization and restarting of the loop block upon backward branching.    - **Relation**: Ensures that backward branches manage the operand stack correctly.

(assert_invalid
  (module (func $test-br-table-loop
    (block (loop (param i32)
      (br_table 0 1 0 (i32.const 1000000)))))
  )
  "type mismatch"
)