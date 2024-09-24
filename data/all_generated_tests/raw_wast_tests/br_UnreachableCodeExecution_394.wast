;; 5. Deeply nested `blocks` where a `br` instruction targets a non-immediate outer block, with `unreachable` instructions inside intermediate blocks. This tests proper stack unwinding and label resolution.

(assert_invalid
  (module
    (func $deep-nesting-with-br
      (block ;; label 0
        (block ;; label 1
          (block ;; label 2
            (unreachable)
            (block ;; label 3
              (br 2)
            )
          )
        )
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)