;; 3. **Test 3**: Use nested blocks with `nop` instructions and ensure normal flow traverses the blocks without hitting `unreachable`, validating that blocks and `nop` instructions are properly managed without altering execution.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (nop)
        (block
          (nop)
          (unreachable)
        )
      )
    )
  )
  "unexpected unreachable"
)