;; 1. **Test Description: Deep Nested Labels**    - Construct a deep nested structure with multiple layers of `block`, `loop`, and `if` control instructions. Use a `br` instruction referencing the outermost label.

(assert_invalid
  (module
    (func $deep-nested-labels
      (block
        (block
          (block
            (block
              (block
                (br 5)
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)