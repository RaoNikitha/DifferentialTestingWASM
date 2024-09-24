;; 3. **Test 3:** Utilize `br_table` with mixed valid and out-of-bound indexes. Surround the `br_table` with a block where `unreachable` precedes the table to see if `unreachable` calls an immediate trap.

(assert_invalid
  (module (func $test-br_table-with-unreachable
    (block
      (unreachable)
      (br_table 0 1 2 (i32.const 0))
    )
  ))
  "type mismatch"
)