;; - **Test 8:**    A `loop` with multiple `br` instructions where the wrong `br` instruction is executed due to stack inconsistency, resulting in the loop not being exited properly and running indefinitely.

(assert_invalid
  (module 
    (func (result i32)
      (loop (result i32)
        (br 1) 
        (br 0 (i32.const 0)) 
      )
    )
  )
  "type mismatch"
)