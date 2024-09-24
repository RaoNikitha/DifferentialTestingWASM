;; 10. **Test 10 - Forward Branch Block Type Mismatch**:     Design a `br_table` instruction with forward branches that have mismatched operand types for the target block's output type. This ensures CFG consistency in handling forward branches according to the specified block output types.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i64)
          (i32.const 0)
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)