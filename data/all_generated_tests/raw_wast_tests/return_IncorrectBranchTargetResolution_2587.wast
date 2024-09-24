;; 6. **Test with Exception Handling Blocks**    - **Description**: Use `try` and `catch` blocks, placing the `return` instruction inside a catch block.    - **Constraint**: Ensures the `return` does not misinterpret the catch block as the function body and unwinds correctly to the outermost block.

(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-exn (result i32)
      (try (result i32)
        (do
          (i32.const 0)
          (throw 0)
        )
        (catch 0
          (return)
        )
      )
    )
  )
  "type mismatch"
)