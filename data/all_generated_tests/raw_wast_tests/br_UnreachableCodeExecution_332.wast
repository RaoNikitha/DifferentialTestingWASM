;; Implement a deeply nested structure of `if` conditions and blocks. Use a `br` to break to an incorrectly indexed label that results in reaching an `unreachable` instruction, highlighting issues with relative label indexing.

(assert_invalid
  (module (func
    (block (result i32)
      (if (i32.const 1)
        (then
          (if (i32.const 0)
            (then
              (block (result i32)
                (br 2) 
                (unreachable)
              )
            )
          )
        )
      )
    )
  ))
  "unknown label"
)