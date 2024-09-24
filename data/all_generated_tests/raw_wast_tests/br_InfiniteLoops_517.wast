;; 8. **Test Description:**    A deep-nested loop structure where a `br` instruction attempts to break multiple layers and resume execution outside all loops. Validate the stack unwinding and label targeting to prevent an infinite loop.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block
            (loop
              (block
                (br 4)
              )
            )
          )
        )
      )
    )
  )
  "undefined label 4"
)