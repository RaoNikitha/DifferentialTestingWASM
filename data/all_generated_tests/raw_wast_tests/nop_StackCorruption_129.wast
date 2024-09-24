;; 10. Place `nop` instructions in nested control structures such as `block` within a `loop` within an `if`-construct to test the integrity of stack handling across multiple layers of control flow boundaries, ensuring `nop` does not introduce any stack inconsistencies.

(assert_invalid
  (module
    (func (result i32)
      (if (i32.const 1)
        (then
          (block
            (loop
              (nop)
              (br 1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)