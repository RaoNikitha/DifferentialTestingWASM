;; Test 4: Set up a loop with a block type specifying a result type but use a `br` instruction that does not match the expected result type of the loop. This will test enforcement of the result type constraint.

(assert_invalid
  (module (func $loop_with_mismatched_br (result i32)
    (i32.const 0)
    (loop $L (result i32)
      (br $L)
    )
  ))
  "type mismatch"
)