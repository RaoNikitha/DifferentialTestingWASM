;; 5. **Test Description**: Insert a `nop` instruction at the critical points of a conditional `if-else` structure that modifies stack values. Check that the execution path taken does not cause unexpected stack changes, asserting that `nop` is correctly skipped.

(assert_invalid
  (module
    (func $test-if-else-nop
      (local i32)
      (i32.const 1)
      (if (result i32)
        (then (nop) (i32.const 42))
        (else (nop) (i32.const 0))
      )
    )
  )
  "type mismatch"
)