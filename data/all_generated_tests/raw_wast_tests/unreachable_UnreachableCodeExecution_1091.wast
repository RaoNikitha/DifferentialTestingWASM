;; 2. Create a `loop` block that iterates a set number of times, but due to a faulty branch condition, eventually executes an `unreachable` instruction. Assess whether the control flow correctly prevents the loop from reaching the `unreachable` instruction.

(assert_invalid
  (module (func $loop-unreachable-test
    (block $outer
      (loop $inner
        (i32.const 0)
        (br_if $inner (i32.const 1))
        (unreachable)
      )
    )
  ))
  "unreachable executed"
)