;; 5. Test a `select` instruction preceding a conditional branch with `unreachable` in the branch's block. Check for condition-based branch decision. Constraint: Validates the interaction between select instruction and branch condition. Example: `(i32.const 1) (i32.const 2) (i32.const 0) (select) (br_if 0 (unreachable))`

(assert_invalid
  (module (func $test-select-branch-cond-unreachable
    (i32.const 1) (i32.const 2) (i32.const 0) (select)
    (block (br_if 0 (unreachable)))
  ))
  "type mismatch"
)