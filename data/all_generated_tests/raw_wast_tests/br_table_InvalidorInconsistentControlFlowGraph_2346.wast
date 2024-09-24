;; Test 6: Create a control flow where `br_table` targets block labels that terminate within an `if` statement. Ensure the control flow exits the enclosing `if` block correctly when the branch is taken. - **Constraint Tested**: Correct exit handling in control flow when branching out of `if` constructs.

(assert_invalid
  (module (func (block (block (if (i32.const 1) (then (br_table 0 1 (i32.const 0)) (unreachable))))))
  "type mismatch"
)