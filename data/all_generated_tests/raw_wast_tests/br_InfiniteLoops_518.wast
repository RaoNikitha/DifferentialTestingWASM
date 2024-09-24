;; 9. **Test Description:**    A `loop` with a `br` instruction nested inside a conditional `if` block, intended to jump to the start of the loop only if the condition holds. Verify that incorrect condition handling does not cause an endless loop.

(assert_invalid
  (module
    (func $test-loop-br-if
      (block $outer
        (loop $inner
          (i32.const 1)
          (if (result i32)
            (i32.const 0)
            (then
              (br $inner)
            )
          )
          (i32.const 0)
          (drop)
        )
      )
    )
  )
  "type mismatch"
)