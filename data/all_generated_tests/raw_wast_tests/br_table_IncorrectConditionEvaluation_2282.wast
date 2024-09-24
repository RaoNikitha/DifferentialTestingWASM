;; 2. **Test Description:** Design a `br_table` with forward branches that should match the output of the block type. The operand stack should have a value disallowed by the condition evaluation. The test intends to identify branching discrepancies when the condition is incorrectly evaluated in `wizard_engine`.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 1 0 (i32.const 2) (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)