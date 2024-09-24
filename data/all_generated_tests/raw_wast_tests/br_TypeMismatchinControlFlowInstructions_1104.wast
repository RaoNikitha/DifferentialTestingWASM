;; 5. **Test for Loop Entered with Mismatched Type**: Define a `loop` instruction with an input type of `f64`. Initiate a branch into this loop with an `i32` type on the stack. Determine if the type mismatch on loop entry is handled properly.

(assert_invalid
  (module (func $loop-enter-mismatched-type 
    (block 
      (loop (result f64) 
        (br 0 (i32.const 5))
      ) 
    )
  ))
  "type mismatch"
)