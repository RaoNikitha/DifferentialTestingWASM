;; 1. **Test Name: No-Operation Between Multiple Function Calls**    - **Description**: Place a `nop` instruction between two consecutive function calls. Ensure that the intermediate state remains unchanged, and the return values are correct.    - **Constraint**: Verify that `nop` insertion does not affect the integrity of the function call sequence or return values.    - **Improper Handling Check**: The test checks if adding `nop` disrupts the function call chain or produces unexpected results.    - **Expected Behavior**: Both implementations should exhibit identical function calls and return sequences.

(assert_invalid
  (module
    (func $fn1 (result i32) (i32.const 42))
    (func $fn2 (result i32) (i32.const 7))
    (func (result i32)
      call $fn1
      nop
      call $fn2
    )
  )
  "type mismatch"
)