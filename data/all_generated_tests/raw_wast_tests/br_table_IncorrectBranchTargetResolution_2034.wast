;; 5. **Different Operand Types in Target Blocks:**    - Design a test where `br_table` targets blocks that consume different operand types, causing type mismatches.    - *Testing for*: Ensuring type matching between branch instruction and target blocks.    - *Constraint*: Operand and target matching.

(assert_invalid
  (module
    (func (param i32)
      (block (result i32)
        (block (result f32)
          (br_table 0 1 (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)