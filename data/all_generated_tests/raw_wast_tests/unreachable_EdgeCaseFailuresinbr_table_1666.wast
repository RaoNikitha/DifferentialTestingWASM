;; 7. **Test Case 7:** Test `br_table` with unreachable by placing an `unreachable` immediately after a series of invalid index ranges. Evaluate if the trap occurs uniformly throughout the index misattribution. \    _Constraint Checked: Consistent trapping with varying index values in branch tables._

(assert_invalid
  (module (func $type-br_table-unreachable
    (block (result i32)
      (block (br_table 1 (i32.const 1)) (unreachable))
      (i32.const 1)
    )
  ))
  "type mismatch"
)