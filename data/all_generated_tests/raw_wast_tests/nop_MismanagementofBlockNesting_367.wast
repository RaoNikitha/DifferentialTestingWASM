;; 8. **Interleaved `if-else` and NOP Blocks**: Design a sequence of `if-else` branches interleaved with `nop` instructions inside nested blocks. Validate that execution reaches the right block after each `nop`.

(assert_invalid
  (module
    (func $if-else-nop
      (if (i32.const 1)
        (then (nop))
        (else
          (block
            (if (i32.const 0)
              (then (nop))
              (else (nop))
            )
          )
        )
      )
    )
  )
)