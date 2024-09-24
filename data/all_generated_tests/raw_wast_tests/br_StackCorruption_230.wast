;; 1. Test a simple `br` instruction targeting an innermost `block` that contains operands. Validate the stack position before and after the branch to ensure proper stack unwinding and restoration. This checks if the stack height and operand integrity are preserved correctly.

(assert_invalid
  (module
    (func $unwind-stack-before-br
      (i32.const 0)
      (i32.const 1)
      (block (br 0))
      (drop)
      (drop)
    )
  )
  "type mismatch"
)