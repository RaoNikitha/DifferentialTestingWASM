;; 1. **Test 1:** A function where the `unreachable` instruction is used inside a block that also contains valid code before and after the `unreachable` instruction. This should test if the block's control flow is interrupted correctly after encountering `unreachable`. ```wat (function (result i32)   (block (result i32)     (i32.const 10)     unreachable     (i32.const 20)   ) ) ```

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 10)
        unreachable
        (i32.const 20)
      )
    )
  )
  "type mismatch"
)