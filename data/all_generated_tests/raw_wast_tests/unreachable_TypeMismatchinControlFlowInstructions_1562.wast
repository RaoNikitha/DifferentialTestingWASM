;; 3. **Test 3: Conditional Trap with Mismatched Branch Types**    - An `if` statement where one branch ends with `unreachable` and the other ends with values of mismatching types. This checks if type reconciliation across conditional branches considers the `unreachable` path properly.    - **Constraint Checked:** Tests whether type merging in conditional paths properly handles `unreachable` outcomes.

(assert_invalid
 (module
  (func $test_conditional_trap (result i32)
    (if (i32.const 1)
      (then (unreachable))
      (else (i64.const 0))
    )
  )
 )
 "type mismatch"
)