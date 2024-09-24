;; 3. **Unbalanced Operand Stack on Branch**: Define a `block` expecting a result type of `i64`, but have a `br_if` inside the block that skips to the block's end with the stack containing `i32` items. This tests if the stack is correctly balanced with the right types before branch instructions are executed.

(assert_invalid
  (module (func $unbalanced-operand-stack-on-branch (result i64)
    (block (result i64)
      (i32.const 1)
      (br_if 0 (i32.const 0))
      (i64.const 2)
    )
  ))
  "type mismatch"
)