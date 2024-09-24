;; 10. Compose a nested control flow with a `block` including function calls to other `block` and `loop` constructs, ensuring each call correctly manipulates the stack. Use `br` to break out of nested functions to their enclosing context. Ensure valid operands are managed, and monitor for stack corruption from improper operand stack handling.

(assert_invalid
  (module
    (func $nested-blocks
      (block $outer
        (block $inner
          (call $dummy)
          (br 1)
        )
      )
      (func $dummy)
    )
  )
  "unknown label"
)