;; 4. **Test 4**: Design an `if` instruction with a `loop` where the `else` part contains a `br` instruction back to the `loop`. Ensure that differential implementations correctly handle the initialization state such that the loop doesn't run indefinitely.

(assert_invalid
  (module
    (func $test4
      (block $outer (loop $inner
        (i32.const 1)
        (if (result i32)
          (then (i32.const 1))
          (else (br $inner))
        )
      ))
    )
  )
  "type mismatch"
)