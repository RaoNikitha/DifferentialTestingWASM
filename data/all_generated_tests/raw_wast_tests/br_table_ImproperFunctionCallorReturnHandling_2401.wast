;; 1. **Test 1: Mismatched Label Arity with Forward Function Call Handling**    - Test a `br_table` instruction with labels that lead to forward function calls but with mismatched arity for the default and target labels. This checks if the arity mismatch is properly identified during forward function calls.

(assert_invalid
  (module
    (func $mismatched-label-arity-forward-call
      (block (result i32)
        (block
          (br_table 0 1 (i32.const 0))
        )
        (call 0)
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)