;; 9. Validate correct behavior in a function with an `if` statement where one condition leads to `unreachable` instruction in a nested block, ensuring execution traps if that path is taken.

(assert_invalid
  (module
    (func $test
      (if (i32.const 1)
        (then
          (block
            (unreachable)
            (i32.add (i32.const 1) (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)