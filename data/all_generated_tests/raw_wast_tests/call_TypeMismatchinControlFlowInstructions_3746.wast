;; 5. **Result Type Mismatch in Loop with Breaks**:    Construct a loop with breaks (`br` instruction) that expects `f32` results but performs a call returning `i32` within the break condition. Test the consistency in type error handling.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (func $test-loop
      (loop $label
        (br_if $label (call 0))
        (f32.const 0.0)
        (br 1)
      )
    )
    (func (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)