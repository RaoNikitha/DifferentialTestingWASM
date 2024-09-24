;; Test 1: Place a `nop` instruction before a `br` instruction in a loop. Validate that the presence of `nop` does not alter the label resolution and the branch correctly goes to the intended loop start.

(assert_invalid
  (module
    (func $test-loop
      (loop $loop_start
        nop
        br $loop_start
      )
    )
  )
  "end of block"
)