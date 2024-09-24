;; 8. **Test Misaligned Operand Stack Operations in Block**:    - Description: Inside a block, perform stack operations that do not align with the block type specification.    - Constraint: Validate correct stack handling by the block instruction according to its type.    - CFG Relevance: Misaligned stack operations can corrupt the expected operand stack state, leading to incorrect CFG paths.

(assert_invalid
  (module (func $misaligned-operand-stack-block (result i32)
    (block (result i32)
      (i64.const 1) 
      (i32.const 2)
    )
  ))
  "type mismatch"
)