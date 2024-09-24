;; 1. Test a simple conditional branch with a constant value and an `unreachable` instruction inside the branch's block. Check for trap behavior. Constraint: Ensures condition evaluation within a branch works correctly. Example: `(i32.const 1) (br_if 0 (unreachable))`

(assert_invalid
  (module
    (func $test_conditional_unreachable
      (block
        (br_if 0 (i32.const 1))
        (unreachable)
      )
    )
  )
 "type mismatch"
)