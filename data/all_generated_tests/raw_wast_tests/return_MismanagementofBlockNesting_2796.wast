;; 5. Use a series of nested `block` instructions where a `return` is executed inside the most deeply nested `block`. The goal is to ensure that `return` unwinds everything until the outermost block, respecting the stack frames correctly.

(assert_invalid
  (module
    (func $nested-blocks-return (result i32)
      (block
        (block
          (block
            (return (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)