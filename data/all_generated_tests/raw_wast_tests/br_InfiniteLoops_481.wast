;; 2. A deeply nested set of `loop` blocks with a `br` instruction targeting an outer loop. Verify that the target loop starts correctly from its beginning and that operand stack unwinding does not result in re-entering the inner loop incorrectly.

(assert_invalid
  (module
    (func $deep_nesting
      (block
        (loop
          (block
            (loop
              (block
                (loop
                  (br 3)
                )
              )
            )
          )
        )
      )
    )
  )
  "invalid jump target"
)