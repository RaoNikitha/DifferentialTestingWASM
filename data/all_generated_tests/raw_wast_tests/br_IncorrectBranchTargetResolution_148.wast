;; Devise a sequence of mixed `if`, `block`, and `loop` constructs where a `br` instruction is used to target an incorrect block relative to its current context, testing if the relative label lookup mechanism handles deep nesting accurately.

(assert_invalid
  (module
    (func
      (block
        (loop
          (if
            (i32.const 1)
            (br 2)
          )
        )
      )
    )
  )
  "unknown label"
)