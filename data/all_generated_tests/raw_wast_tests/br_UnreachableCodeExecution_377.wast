;; 8. Compose a piece of code with multiple levels of `block` and `if` constructs, ensuring that a `br` incorrectly implemented could navigate through to an `unreachable` instruction placed within intermediate structures.

(assert_invalid
  (module
    (func $test
      (block
        (block
          (if (i32.const 1)
            (then
              (br 2)
              (unreachable)
            )
          )
        )
      )
    )
  )
  "unknown label"
)