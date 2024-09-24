;; - **Test 1:**    A `loop` construct that contains a `br` instruction targeting the start of the loop. It should branch back to the beginning of the loop each time without any condition or instruction to break the loop, leading to infinite iteration.

(assert_invalid
  (module
    (func $infinite-loop 
      (loop $outer-loop 
        (br 0)
      )
    )
  )
  "unreachable code"
)