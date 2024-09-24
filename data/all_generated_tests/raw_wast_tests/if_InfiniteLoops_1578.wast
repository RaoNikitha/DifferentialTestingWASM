;; 9. **Test 9**: Implement an `if` instruction inside a `loop` with the loop containing a `br_if` that depends on a condition reset in the `else` block. Incorrect handling in re-initialization can cause this to become an infinite loop.

(assert_invalid
  (module (func $test9
    (loop $outer
      (if (i32.const 0)
        (then
          (br $outer)
        )
        (else
          (br_if $outer (i32.const 0))
        )
      )
    )
  ))
  "type mismatch"
)