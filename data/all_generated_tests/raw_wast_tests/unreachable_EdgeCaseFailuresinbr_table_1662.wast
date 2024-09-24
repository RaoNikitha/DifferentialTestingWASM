;; 3. **Test Case 3:** Use a block with a `br_table` where the `unreachable` is placed inside the block before the `br_table`. Verify if hitting `unreachable` within differing block scopes causes a trap without executing the branch table. \    _Constraint Checked: Consistency in trapping within nested blocks and correct execution halt._

(assert_invalid
  (module (func $test-block-unreachable-br_table
    (block (unreachable) (br_table 0 (i32.const 0)))
  ))
  "type mismatch"
)