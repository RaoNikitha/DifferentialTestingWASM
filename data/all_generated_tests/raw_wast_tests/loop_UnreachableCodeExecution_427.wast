;; 8. **Test Description 8**: Set up a loop block type with inputs that incorrectly propagates and results in misindexed labels. After the loop, place an `unreachable` instruction to test if improperly handled input stack unwinding mistakenly reaches this instruction.

(assert_invalid
  (module (func $label-misindex-propagation
    (loop (result i32 i32)
      (i32.const 1)
      (i32.const 2)
      (br 0)
      (unreachable)
    )
  ))
  "type mismatch"
)