;; 2. **Blocks with Conditional Branches and Function Calls**:    - Test multiple nested conditional branches within blocks containing calls. Verify that returning from a nested branch leads back to the correct point in the outer structure.    - Confirm that function calls do not disrupt the flow with incorrect function index lookup.

(assert_invalid
  (module
    (func $nested-conditionals
      (block
        (i32.const 0)
        (br_if 0 (i32.eqz (call 1 (i32.const 1))))
        (block
          (i32.const 1)
          (br_if 0 (i32.eqz (call 1 (i32.const 2))))
        )
      )
    )
    (func (param i32))
  )
  "type mismatch"
)