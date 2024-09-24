;; 2. **Test Description:**    - Define a `loop` with an input type `f64`.    - Within the loop, use a `br` instruction aiming to jump back to the loop’s beginning but with an `i32` value on the stack instead.    - This tests the handling of mismatched operand types for backward branches to loops.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (loop (result f64) 
        (br 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)