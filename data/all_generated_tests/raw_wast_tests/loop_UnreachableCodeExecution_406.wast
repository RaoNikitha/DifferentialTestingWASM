;; 7. **Unreachable After Valid Nested Blocks**:    Compose a loop containing nested blocks or structures (`block`, `if`) that end correctly, followed by an `unreachable`. Ensure that execution successfully traverses the nested structures before trapping at the unreachable point.

(assert_invalid
  (module
    (func
      (loop
        (block
          (block
            (br 1)
          )
        )
        (unreachable)
      )
    )
  )
  "unreachable code after nested blocks"
)