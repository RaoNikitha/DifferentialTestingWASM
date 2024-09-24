;; 1. Create a test with a `loop` statement containing an `if` instruction where the `if` condition always evaluates to true and `br` is used incorrectly inside the `if` block, preventing the loop from breaking out:    ```    (loop $label      (if (i32.const 1)        (then (br $label))      )    )    ```    This checks how each implementation handles conditional branching within a loop intended to exit the loop but mistakenly continues looping.

(assert_invalid
  (module
    (func $loop-with-if-br
      (loop $label
        (if (i32.const 1)
          (then (br $label))
        )
      )
    )
  )
  "invalid break"
)