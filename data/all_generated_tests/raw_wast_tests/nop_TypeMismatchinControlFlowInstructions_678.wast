;; 9. **Interleaved `nop` with invalid block value production**:    Mix `nop` instructions within a block that begins with values pushed to the stack but do not end with sufficient types to satisfy the block's expected result type.    This tests the midpoint type-consistency within control structures.

(assert_invalid
  (module
    (func
      (block (result i32)
        i32.const 1
        nop
        nop
      )
    )
  )
  "type mismatch"
)