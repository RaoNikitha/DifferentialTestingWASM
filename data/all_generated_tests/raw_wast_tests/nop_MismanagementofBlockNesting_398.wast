;; 9. **Mixed Depth Blocks with `nop` and Parametric Instructions**:    Combine nested blocks of varying depths with `nop` and parametric instructions (e.g., `call_indirect`). Check that `nop` does not interfere with parameter passing and the block's validity.

(assert_invalid
  (module
    (func
      (block
        (nop)
        (call_indirect (type 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)