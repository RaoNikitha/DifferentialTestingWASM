;; 7. **Invalid Break Depth**: Craft an `if` block within an `if` and a `loop`, with a `br` instruction incorrectly referencing a non-existent higher-level block, testing error-handling for invalid label references.

(assert_invalid
  (module
    (func
      (block
        (if
          (i32.const 1)
          (then
            (loop
              (br 2)  ;; Invalid break depth, there is no outer block to break
            )
          )
        )
      )
    )
  )
  "invalid break depth"
)