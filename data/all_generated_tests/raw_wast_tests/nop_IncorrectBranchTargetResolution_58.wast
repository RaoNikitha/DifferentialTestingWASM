;; Test 9: Add `nop` before a `br` instruction in a nested `block` within a `loop`. Check that the `br` instruction correctly resolves to the intended block, unaffected by `nop`.

 ;; (module
  (func $test
    (loop $loop
      (block $block
        nop
        br $block
      )
    )
  )
)