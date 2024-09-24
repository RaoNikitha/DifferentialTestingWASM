;; 10. Test Description: Implement a function containing multiple calls and a `br` instruction that improperly manages operands leading to incorrect setup for a return operation, validating the precise context adherence of the validator regarding function returns.

(assert_invalid
  (module
    (func (result i32)
      (call 0)
      (block (result i32) (br 0) (i32.const 0))
      (call 0)
      (i32.add) (return)
    )
  )
  "type mismatch"
)