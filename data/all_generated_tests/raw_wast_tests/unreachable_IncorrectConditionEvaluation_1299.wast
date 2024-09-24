;; 10. Test multiple conditional branches in sequence, each containing `unreachable` instruction. Verify that all conditions are evaluated correctly before trapping. Constraint: Checks sequential condition evaluations for branching. Example: `(i32.const 1) (br_if 0 (unreachable)) (i32.const 0) (br_if 0 (unreachable))`

(assert_invalid
  (module (func $multiple-conditional-branches
    (block (result i32)
      (i32.const 1) (br_if 0 (unreachable))
      (i32.const 0) (br_if 0 (unreachable))
    )
  ))
  "type mismatch"
)