;; 8. Call a function inside a `loop` instruction, expecting the loop's continued iteration based on mismatched type conditions.

(assert_invalid
  (module
    (func $type-mismatch-loop
      (loop
        (call 1)
      )
    )
    (func (param i32) (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)