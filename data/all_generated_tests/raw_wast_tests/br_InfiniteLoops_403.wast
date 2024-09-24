;; 4. Implement a scenario where an outer `loop` contains an inner `block`, and use a `br` instruction to exit the inner `block`, ensuring the operand stack is unwound correctly and does not affect the surrounding loop execution leading to an infinite loop.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result i32)
        (block (result i32)
          (br 1 (i32.const 1))
        )
        (i32.const 0) 
      )
    )
  )
  "type mismatch"
)