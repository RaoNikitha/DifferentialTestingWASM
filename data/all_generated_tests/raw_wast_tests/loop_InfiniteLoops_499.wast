;; Test 10: Construct a loop with nested `loop` and `if` statements where an `if` within the loop contains a `br` instruction conditioned on the correct interpretation of labels and stack unwinding.

(assert_invalid 
  (module 
    (func (local i32) 
      (loop (result i32) 
        (i32.const 1) 
        (loop (result i32) 
          (i32.const 2) 
          (if (result i32) 
            (i32.const 0) 
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)