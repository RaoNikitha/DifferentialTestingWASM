;; Test 5: A `block` instruction where a deeply nested `block` ends with a `br` instruction targeting the outermost block. The test verifies the correct handling of unrolling the stack to the correct height and ensuring no stack corruption occurs due to premature `end`.

(assert_invalid
  (module (func $deep-nested-blocks (result i32)
    (block (result i32)
      (block
        (block
          (br 2 (i32.const 10))
        )
      )
    )
  ))
  "type mismatch"
)