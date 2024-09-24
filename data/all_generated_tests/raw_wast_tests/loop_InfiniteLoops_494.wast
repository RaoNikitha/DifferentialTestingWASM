;; Test 5: Craft a loop that relies on the correct identification of the innermost loop label by using nested labeled blocks, where control flow must re-enter the proper loop upon a `br` instruction.

(assert_invalid
  (module
    (func $nested-loops-bug
      (loop $outer (result i32)
        (i32.const 1)
        (loop $inner (result i32)
          (i32.const 2)
          (br 2)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)