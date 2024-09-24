;; 7. **Test 7: BrTable Targeting Recursive Function Calls**    - Implement a test where the `br_table` instruction targets different labels leading to recursive function calls with arity mismatches. Validate that these arity mismatches are correctly identified and cause an error, preventing incorrect recursion depth handling.

(assert_invalid
  (module (func $recursive-call
    (block (br_table 0 1 (i32.const 0))
    (call $recursive-call (i32.const 1))))
  )
  "arity mismatch"
)