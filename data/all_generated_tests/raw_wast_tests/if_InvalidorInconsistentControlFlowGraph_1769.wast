;; 10. **Type Mismatch in Block Return Types**:    - Create an `if` block with return instructions that have mismatched types for the block return type, verifying CFG handling of incorrect return type propagation.    - *Constraint*: Ensuring the block return types are validated and matched correctly as per function signature.    - *Relation to CFG*: Tests CFG’s management and validation of return types for control flow integrity.

(assert_invalid
  (module (func $type-mismatch-block-return (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 1))
      (else (i64.const 1))
    )
  ))
  "type mismatch"
)