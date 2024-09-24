;; 9. Test the type flow in an `unreachable` instruction sequence by placing a `nop` followed by operations that will never execute including `i32.const` and `i32.sub`. Ensure the `nop` does not accidentally affect type verification even in unreachable contexts.

(assert_invalid
  (module
    (func $test
      (unreachable)
      (nop)
      (i32.const 42)
      (i32.sub)
    )
  )
  "type mismatch"
)