;; 2. **Nested Blocks with Mismatched Operand Types:**    Use `br_table` within nested blocks where the operand stack type expected by the blocks does not match the types provided by the instruction. This will check if the CFG correctly unwinds the operand stack and validates against nested block types.

(assert_invalid
  (module
    (func $nested-blocks-mismatch
      (block (result i32)
        (block
          (i32.const 1) (i64.const 0) (br_table 0 0)
        )
      )
    )
  )
  "type mismatch"
)