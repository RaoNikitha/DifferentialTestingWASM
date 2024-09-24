;; 1. **Test Description:**     - Create a `block` with an expected result type of `i32`.    - Inside the block, use a `br` instruction to branch to the end of the block without pushing an `i32` on the stack.    - This test checks if the implementation correctly enforces the expected `i32` result type when exiting the `block`.

(assert_invalid
  (module
    (func $test_invalid_br_without_i32 (result i32)
      (block (result i32)
        (br 0)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)