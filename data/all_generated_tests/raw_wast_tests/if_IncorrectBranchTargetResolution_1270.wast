;; 1. **Branch beyond immediate scope test**: Create an `if` block that contains an inner nested block (`block`) and an `else` part. Use the `br` instruction within the `else` part attempting to break to the outer block improperly which should cause an error in proper implementations but might incorrectly resolve in faulty implementations.    ```    (block      (if (i32.const 0)         (block $inner_block          (br $outer_block)        )         (else           (br $outer_block)        )      )    )    ```

(assert_invalid
  (module
    (block $outer_block
      (if (i32.const 0)
        (block $inner_block
          (br $outer_block)
        )
        (else
          (br $outer_block)
        )
      )
    )
  )
  "unknown label"
)