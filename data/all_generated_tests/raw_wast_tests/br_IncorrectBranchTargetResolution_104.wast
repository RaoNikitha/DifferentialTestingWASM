;; 5. **Test Backward Jump in Loops:**    - Place a `br` instruction inside a loop targeting its own label. This assesses if the backward jump correctly resolves to the beginning of the loop.

(assert_invalid
  (module
    (func $loop-backward-jump
      (loop $loop
        (i32.const 1)
        (br 0)
      )
    )
  )
  "type mismatch"
)