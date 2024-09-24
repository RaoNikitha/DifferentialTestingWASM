;; 3. **Test Description**: Implement a `block` which expects its instructions to resolve to `[]`, but includes a branch instruction (`br`) that produces an out-of-place stack value like `i32`. This will check if the branch instruction is correctly validated within the block.

(assert_invalid
  (module (func $type-block-wrong-stack
    (block (block (result []) (br 0 (i32.const 42))))
  ))
  "type mismatch"
)