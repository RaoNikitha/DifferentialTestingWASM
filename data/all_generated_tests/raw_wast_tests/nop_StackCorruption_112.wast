;; 3. Position a `nop` instruction between two `if` blocks that alter stack values and confirm that the stack state pre- and post-`nop` remains consistent even with conditional branching.

(assert_invalid
  (module
    (func $test
      (i32.const 1)
      (if (result i32)
        (then
          (i32.const 2)
        )
        (else
          (i32.const 3)
        )
      )
      (nop)
      (if (result i32)
        (then
          (i32.const 4)
        )
        (else
          (i32.const 5)
        )
      )
      drop
    )
  )
  "type mismatch"
)