;; - **Test 3:**    A `loop` with an inner `if` condition that always fails and a `br` instruction that targets the loop without any intermediary condition, resulting in the loop iterating indefinitely due to the unconditional branch back to the loop's start.

(assert_invalid
  (module
    (func
      (loop
        (if (i32.const 0) 
          (then (nop))
        )
        (br 0)
      )
    )
  )
  "loop does not terminate"
)