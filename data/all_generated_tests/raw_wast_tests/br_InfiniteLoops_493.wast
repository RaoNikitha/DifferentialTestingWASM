;; 4. **Incorrect Forward Branch in Loop**: Use a `br` instruction to perform a forward branch within a loop to verify that the implementation resumes execution after the correct `end` instruction. Misimplementations could result in infinite looping if the forward branch does not skip past the `end`.

(assert_invalid
  (module
    (func $incorrect_forward_branch_in_loop
      (loop $outer
        (block $inner
          (br 1)
        )
        (br 0)
      )
    )
  )
  "unknown label"
)