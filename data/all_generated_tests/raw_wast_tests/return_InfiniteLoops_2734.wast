;; 3. **Nested Loop with Early Return**:    Design a function with nested loops where the inner loop contains a `br` instruction to skip to the outer loop, followed by a `return`. If the implementation incorrectly handles `return` within nested loops, it will be prone to infinite loops if the return does not correctly target the outermost block.

(assert_invalid
  (module
    (func $nested-loop-with-early-return (result i32)
      (block (result i32)
        (loop
          (loop (br 1) (return (i32.const 1)))
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)