;; 1. Test Description: Create a nested function with multiple levels of blocks and loops. Insert a `return` instruction inside the innermost loop that targets the outermost function. Verify that the stack unwinds correctly, returning control to the correct outer block. This will test if the return instruction correctly resolves the target block even when deeply nested.

(assert_invalid
  (module
    (func $nested-return (result i32)
      (block $outer
        (block $inner
          (loop $loop
            (i32.const 42)
            (return)
          )
        )
      )
    )
  )
  "type mismatch"
)