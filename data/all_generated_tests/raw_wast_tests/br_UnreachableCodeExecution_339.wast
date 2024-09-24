;; Design a nested series of `loop` and `block` statements. Use a `br` instruction that incorrectly targets an outer `block`'s label, leading to an `unreachable` instruction if the implementation doesn't correctly interpret the branch context.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block
            (br 2)
          )
        )
      )
    )
  )
  "label out of range"
)