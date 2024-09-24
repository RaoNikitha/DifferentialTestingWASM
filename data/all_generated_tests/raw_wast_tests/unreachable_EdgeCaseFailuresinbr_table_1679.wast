;; 10. **Test 10:** Set up a `br_table` that returns various types, and place an `unreachable` to disrupt type consistency checks. Validate if the engine correctly traps on `unreachable` and not because of type mismatches.

(assert_invalid
  (module
    (func (block (block (br_table 0 0 0 (i32.const 0)))) (unreachable))
  )
  "type mismatch"
)