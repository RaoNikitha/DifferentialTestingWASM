;; 2. **Branching Within Nested Blocks**:    Create a test with three nested blocks and use `br` to jump to each block's outer block, ensuring the correct block is exited and the stack is properly managed. This checks the branch resolution and stack unwinding for nested blocks.

(assert_invalid
  (module (func $nested-block-branch (result i32)
    (block (result i32)
      (i32.const 10)
      (block (result i32)
        (i32.const 20)
        (block (result i32)
          (i32.const 30)
          (br 1)
        )
      )
      (br 0)
    )
  ))
  "type mismatch"
)