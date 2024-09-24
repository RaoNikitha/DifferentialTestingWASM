;; 2. **Test 2**: Use a `block` with a `blocktype` that takes an `i64` input but omit the necessary instruction to push an `i64` onto the stack before entering the block. This will test whether the stack is correctly checked for type-determined entry conditions.

(assert_invalid
  (module (func $type-block-missing-i64-input (result i64)
    (block (result i64) (end)) 
  ))
  "type mismatch"
)