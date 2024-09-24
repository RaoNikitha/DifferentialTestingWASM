;; 7. **Loop Exiting through Nested Block**: Create a loop that needs to exit through several nested blocks using a `br` instruction. Confirm if the stack unwinds up to the correct outermost block and returns the proper value, avoiding infinite loops from nested block mishandling.

(assert_invalid
  (module
    (func $loop-exit-nested-blocks (result i32)
      (block $outer (result i32)
        (block $inner
          (loop $loop
            (br $inner)
          )
          (return)
        )
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)