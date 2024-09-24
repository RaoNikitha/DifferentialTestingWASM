;; 4. **Mismatched Operand Stack After Unwinding:**    - Define a `br_table` inside a block where the operand stack after unwinding does not match the expected stack configuration.    - *Testing for*: Proper stack management after branching.    - *Constraint*: Stack management and control flow constraints.

(assert_invalid
  (module (func
    (block (result i32)
      (br_table 1 0 (i32.const 1) (i32.const 42))
    )
    (drop)
  ))
  "type mismatch"
)