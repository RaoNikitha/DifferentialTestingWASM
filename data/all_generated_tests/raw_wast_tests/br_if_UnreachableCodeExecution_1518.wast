;; 9. **Test 9 - Nested `if` with False Condition Leading to Unreachable**:    Structure a nested `if` statement where the false branch leads directly to an `unreachable` instruction using a `br_if` with a false condition. This verifies correct handling of false conditions in nested `if` constructs.

(assert_invalid
  (module
    (func $nested-if-false-branch-unreachable
      (block $outer
        (block $inner
          (if (i32.const 0)
            (then (nop))
            (else (br_if 0 (i32.const 0) (br $outer)))
          )
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)