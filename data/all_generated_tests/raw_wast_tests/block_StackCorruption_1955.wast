;; 6. **Cross-block Operand Use**: Create blocks that are dependent on values pushed in preceding blocks, ensuring that stack state transitions correctly between block boundaries and catches improper stack accesses across these boundaries.

(assert_invalid
  (module (func $cross-block-operand-use
    (block (result i32)
      (block (block 
        (i32.const 1)
        (br 1)
        (i32.const 2)
      ) (i32.add))
    )
  ))
  "type mismatch"
)