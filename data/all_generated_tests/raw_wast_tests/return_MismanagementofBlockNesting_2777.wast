;; 6. **Test Description:**    - Write a function with mixed nesting of `block` and `loop` constructs, with a `return` instruction placed inside the `loop`.    - Ensure there are significant stack operations within the loop and blocks.    - The test ascertains if the `return` instruction exits from the right function context, disregarding deeper loop nesting.    - **Specific Constraint:** Mismanagement of mixed block-loop structures and stack consistency when using `return`.

(assert_invalid
  (module
    (func $nested-block-loop (result i32)
      (block
        (loop
          (i32.const 10)
          (return)
          (i32.const 20)
        )
      )
    )
  )
  "type mismatch"
)