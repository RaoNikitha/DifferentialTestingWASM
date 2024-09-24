;; Arrange a series of nested `if` statements with nested loops. Introduce a `br` instruction targeting a loop from within an `if` statement, but with an invalid label index. This should result in an `unreachable` instruction if the implementation mishandles stack polymorphism.

(assert_invalid
  (module
    (func $nested-if-loop
      (block
        (if (i32.const 1)
          (then
            (loop
              (if (i32.const 1)
                (then
                  (br 2) 
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)