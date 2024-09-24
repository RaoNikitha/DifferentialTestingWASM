;; 5. Design a function with a `br_table` instruction where all target labels expect an i32 operand, but the default label expects an i64 operand. Trigger the default label by supplying an out-of-bounds operand. This examines the CFG for operand type mismatches across different branch targets.

(assert_invalid
  (module 
    (func $mismatched_default_operand
      (block (result i32)
        (block 
          (result i32)
          (br_table 0 1 (i32.const 2))
        )
        (drop)
      )
      (block (result i64) (i64.const 0))
    )
  )
  "type mismatch"
)