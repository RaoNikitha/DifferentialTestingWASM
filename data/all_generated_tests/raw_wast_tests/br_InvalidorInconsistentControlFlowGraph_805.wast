;; 6. **Error Handling on Empty Value Stack Test:**    Use nested blocks with a `br` instruction attempting to pop from an already empty stack, ensuring the engine's error handling for empty stack scenarios based on whether the block was reachable or not.

(assert_invalid
  (module
    (func $empty-value-stack
      (block
        (block
          (br 1)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)