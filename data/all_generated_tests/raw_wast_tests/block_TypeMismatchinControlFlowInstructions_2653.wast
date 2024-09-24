;; Test 4: Implement a block with an explicit function type that expects an i32 input and produces an i32 output. Place instructions that modify the stack so that when the block ends, the type requirements aren't met (e.g., start and end with an empty stack or an underflow/overflow).

(assert_invalid
  (module (func $block-type-mismatch (param i32) (result i32)
    (block (result i32)
      (i32.const 42)
      drop
    )
  ))
  "type mismatch"
)