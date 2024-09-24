;; 8. **Test 8**: Use `nop` within nested `block` and `loop` structures where the loop contains `br_if` instructions. Validate that `br_if` correctly respects the intended block and loop nesting levels.

(assert_invalid
  (module
    (func $test-nop
      (block $outer
        (loop $inner
          nop
          br_if $outer
        )
      )
    )
  )
  "type mismatch"
)