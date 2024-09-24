;; 1. **Test for Unwinding Stack to Incorrect Depth:**    - Construct nested `block` instructions and use the `br` instruction to jump to an outer block. Verify if the `operand stack` is correctly unwound to the exact depth of the outer block, ensuring no residual operands remain from inner blocks.

(assert_invalid
  (module
    (func $unwinding-stack-incorrect-depth
      (block $outer (result i32)
        (block $inner (result i32)
          (i32.const 42)  ;; push 42 onto the stack
          (br 1)          ;; branch to outer block
        )
        (drop)            ;; correct stack height should not have any remaining operands
      )
    )
  )
  "type mismatch"
)