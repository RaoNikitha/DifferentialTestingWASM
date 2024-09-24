;; 6. **Branch with Extra Operands**:    - **Focus**: Stack unwinding upon branch.    - **Description**: In the `if` block, include a branch instruction that consumes more operands than available. Verify that the differential implementations handle stack unwinding properly.

(assert_invalid
  (module 
    (func $branch-with-extra-operands (param i32 i32) (result i32)
      (if (result i32) (i32.const 1)
        (then (br 0 (i32.add (local.get 0) (local.get 1))))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)