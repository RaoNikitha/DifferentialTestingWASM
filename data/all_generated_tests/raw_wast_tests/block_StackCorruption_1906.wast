;; Testing a `block` where an incorrect value type is pushed just before an `end` instruction to see if the implementation fails to catch the stack type mismatch.

(assert_invalid
  (module (func $test-block-type-mismatch (result i32)
    (block (result i32)
      (i64.const 1)
      (end)
    )
  ))
  "type mismatch"
)