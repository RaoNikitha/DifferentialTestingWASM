;; 10. **Function Return with Nested br Instruction:**    Nest a `br` instruction within function calls that also involve `return` instructions. Evaluate how the `br` instruction interacts with returning from the function, ensuring proper operand stack handling and control transfer.

(assert_invalid
  (module
    (func $function-return-with-nested-br
      (result i32)
      (block (result i32)
        (return (br 0 (i32.const 0)))
      )
    )
  )
  "type mismatch"
)