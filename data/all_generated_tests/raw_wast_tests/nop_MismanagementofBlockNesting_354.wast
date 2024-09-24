;; 5. **Test Description**:    A complex nested combination of `block`, `loop`, and `if` structures will be tested with numerous `nop` instructions. The test will ensure that the `nop` instruction doesn't alter the flow when nested within multiple levels of control instructions.

(assert_invalid
  (module
    (func
      (block
        (loop
          (if (i32.const 1)
            (then (nop))
            (else (block (nop) (nop) (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)