;; 10. Create a complex structure of labeled blocks and loops, placing an `unreachable` inside one deeply nested block. Ensure that the correct resolution of any `br` instruction targeting outer loops and blocks is halted by the trap.

(assert_invalid
  (module
    (func $nested-unreachable
      (block $outer
        (loop $inner
          (block $middle
            (unreachable)
            (br $outer)
          )
        )
      )
      (i32.const 1)
    )
  )
  "unreachable instruction should trap"
)