;; 7. **Test 7**: A `br_if` instruction inside a loop that indirectly modifies stack operands within the loop, possibly leading to incorrect stack states and infinite loops if Wizard Engine's stack polymorphism handling isn't correct.

(assert_invalid
  (module
    (func $loop-modify-stack
      (loop $top
        (br_if 0 (i32.const 1) (i32.const 0))
        (drop)
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)