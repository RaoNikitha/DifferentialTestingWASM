;; 7. **Test for Labels at Different Nesting Levels:**    Use `br` instructions with labels targeting varying levels of nested blocks to see if the implementation correctly resolves the relative label index based on the current nesting depth.

(assert_invalid
  (module
    (func $nested-br-label
      (block
        (block
          (block
            (br 3)
          )
        )
      )
    )
  )
  "unknown label"
)