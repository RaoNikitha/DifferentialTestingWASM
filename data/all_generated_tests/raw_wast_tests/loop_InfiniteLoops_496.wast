;; Test 7: Create a loop where a `br` instruction is used to break multiple nested loops, ensuring the loop label handling correctly exits the right loop level without causing infinite loops.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32) 
        (i32.const 1)
        (br 1))
      (i32.const 0))
  )
  "type mismatch"
)