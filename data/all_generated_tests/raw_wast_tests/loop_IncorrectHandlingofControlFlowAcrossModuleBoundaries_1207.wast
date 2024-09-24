;; 8. **Test 8**:    - Description: Create a loop with an `if-else` structure inside, where both branches call different imported functions, and verify if stack unwinding is performed correctly.    - Specific Constraint: Ensure both branches of the conditional handle stack operations properly after calling different external functions.    - Control Flow Relation: Ensures conditional structures within loops manage stack correctly during external calls.

(assert_invalid
  (module
    (import "env" "funcA" (func $funcA))
    (import "env" "funcB" (func $funcB))
    (func (param i32) (result i32)
      (loop (result i32)
        (local.get 0)
        (if (result i32)
          (then 
            (call $funcA)
            (drop)
            (i32.const 1)
          )
          (else 
            (call $funcB)
            (drop)
            (i32.const 0)
          )
        )
        (local.get 0)
        (br_if 0)
      )
    )
  )
  "type mismatch"
)