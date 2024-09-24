;; 3. **Test 3**: Implement a `block` with an `end` instruction followed by a `call` to a function that returns multiple values. This checks how each implementation manages the operand stack when returning to the block, particularly around multi-value returns.

(assert_invalid
  (module
    (func $multi_value_fn (result i32 i64)
      (i32.const 42)
      (i64.const 84)
    )
    (func $test
      (block (result i32 i64)
        (end)
        (call $multi_value_fn)
      )
    )
  )
  "type mismatch"
)