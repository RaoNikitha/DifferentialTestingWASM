;; 2. Test Description: Implement a function that contains a block with a mismatched return type. Add a `return` instruction within this block and check for type mismatches in the output. This test checks for the correct handling of operand stack unwinding and type validation upon encountering a return instruction.

(assert_invalid
  (module
    (func $mismatched-return-type (result i32)
      (block (result f32)
        (return (i32.const 1))
      )
    )
  )
  "type mismatch"
)