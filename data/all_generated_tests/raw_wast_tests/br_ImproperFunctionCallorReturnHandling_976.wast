;; 7. **Function Call with Multiple Return Values:**    - Test a function call (`call`) within a `block` that returns multiple values, followed by a `br` instruction targeting the block level. Ensure the branch correctly unwinds the operand stack and handles multiple returned values.

(assert_invalid
  (module
    (func $multiple_return_call_and_br
      (block (result i32 i64)
        (call 0) ; assuming call 0 returns (i32, i64)
        (br 0)
      )
    )
  )
  "type mismatch"
)