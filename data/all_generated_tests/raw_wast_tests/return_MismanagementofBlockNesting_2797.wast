;; 6. Create a sequence where a `block` contains a `loop` which then contains condition checks, finishing with a `return` statement inside the condition block. The test validates that the `return` instruction exits the entire function rather than the loop or only the condition block.

(assert_invalid
  (module
    (func $test_function (result i32)
      (block
        (loop
          (i32.const 1)
          (if (then (return)))
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)