;; 8. **Test 8**: Design an `if` instruction where the `else` block contains a state-altering instruction followed by a `br` back to an outer loop. Check for infinite loops arising from improper state resets.

(assert_invalid
  (module
    (func $infinite-loop-if (result i32)
      (loop $outer
        (if (result i32)
            (i32.const 1)
          (then
            (i32.const 2)
          )
          (else
            (i32.const 3)
            (br $outer)
          )
        )
      )
    )
  )
  "type mismatch"
)