;; 8. Implement a block that contains another block, both holding local variables. Perform operations that interact with these variables and then call `return` from the inner block. This ensures the `return` correctly unwinds to the outermost function block.

(assert_invalid
  (module
    (func $nested-return (result i32)
      (local i32)
      (local i32)
      (block 
        (block
          (local.set 0 (i32.const 42))
          (local.set 1 (i32.const 10))
          (return)
        )
        (local.get 0)
      )
    )
  )
  "type mismatch"
)