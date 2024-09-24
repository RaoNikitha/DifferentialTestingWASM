;; 3. **Test Description**:    This test will feature an `if-else` structure inside a `block`, containing several `nop` instructions within both the `if` and `else` branches. The aim is to ensure the interpreter ignores the `nop` and correctly handles conditional branching.

(assert_invalid
  (module 
    (func $conditional_nop_block
      (block
        (if (i32.const 1)
          (then (nop))
          (else (nop))
        )
      )
    )
  )
  "type mismatch"
)