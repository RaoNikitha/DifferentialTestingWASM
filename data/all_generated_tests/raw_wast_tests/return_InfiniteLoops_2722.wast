;; Create a function that performs a loop with a `return` instruction within an `if` statement inside the loop. Check if the `return` correctly breaks out of the loop and unwinds the operand stack to the function start.

(assert_invalid
  (module
    (func $test-loop-return (result i32)
      (local i32)
      (i32.const 1)
      (loop $loop
        (i32.const 2)
        (if (i32.eqz (local.get 0))
            (return (i32.add (i32.const 3) (i32.const 4)))
        )
        (br $loop)
      )
    )
  )
  "type mismatch"
)