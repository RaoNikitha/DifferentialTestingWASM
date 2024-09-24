;; 7. **Test Description:**    Test an `if-else` block where both branches call functions from different imported modules. Ensure that the operand stacks and control flow are consistent, checking that regardless of the branch taken, the return to the originating module's execution path maintains stack integrity and correct control transfer.

(assert_invalid
  (module
    (import "mod1" "func1" (func (result i32)))
    (import "mod2" "func2" (func (result i32)))
    (func (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (call 0)
          (i32.const 1) ;; Ensure stack height consistency
        )
        (else
          (call 1)
          (i32.const 1) ;; Ensures stack height consistency
        )
      )
    )
  )
  "type mismatch or stack imbalance"
)