;; - **Test 2:**    A nested `loop` inside a `block`, where the `br` instruction incorrectly targets the outer `block` instead of the inner `loop`, preventing the loop from breaking and creating an infinite loop.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)