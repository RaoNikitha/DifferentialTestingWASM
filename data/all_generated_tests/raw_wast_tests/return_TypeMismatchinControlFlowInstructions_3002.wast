;; 1. **Test with Incorrect Block Return Type**:    - Create a function with a block expecting a single `i32` value to be returned. Inside the block, yield an `i64` value instead.    - **Constraint:** The `return` instruction must correctly identify the return type mismatch when exiting the block.    - **Type Mismatch:** Ensures the rules for block return type validation are correctly enforced.

(assert_invalid
  (module
    (func $incorrect-block-return-type (result i32)
      (block (result i32) 
        (i64.const 42)
        (return)
      )
    )
  )
  "type mismatch"
)