;; 6. **Test Description**:    Include `loop` structures with inner `block` structures, and `nop` instructions inside the inner blocks. This test will check the consistency of exiting the inner blocks and re-entering the outer loop correctly.

(assert_invalid
  (module
    (func $complex-nop
      (loop $outer
        (block $inner
          (nop)
        )
      )
    )
  )
  "type mismatch"
)