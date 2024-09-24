;; 8. Test a function returning from an intermediate nested block:    - Define a function which has nested blocks and uses `return` within these blocks.    - Ensure the function correctly returns from the outermost block, ignoring the nested context.

(assert_invalid
  (module
    (func $nested-block-return (result i32)
      (block (block (return (i32.const 1))) (i32.const 0))
    )
  )
  "type mismatch"
)