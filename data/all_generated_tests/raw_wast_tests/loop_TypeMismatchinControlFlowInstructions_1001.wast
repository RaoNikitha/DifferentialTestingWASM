;; 2. **Test for Loop with Branch to Block with Different Types**: Implement a loop where an unconditional branch (`br`) targets a block that returns a type different from the loop's result type (e.g., loop expecting `i32` but branch target returns `f32`).

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (br 1 (f32.const 0.0))
      )
    )
  )
  "type mismatch"
)