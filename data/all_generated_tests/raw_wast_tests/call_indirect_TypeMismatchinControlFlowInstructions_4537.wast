;; 6. **Incorrect Type Handling in Nested Loops with Indirect Call**:    - Description: Design nested `loop` constructs where the outer expects an `i32` and an indirect call within the inner loop returns an `f64`. The exit of the inner loop should mismatch the outer loop's expected type.

(assert_invalid
  (module
    (type (func (result f64)))
    (type (func (param i32) (result i32)))
    (func $f (result f64) (f64.const 0))
    (table funcref (elem $f))
    (func (result i32)
      (loop (result i32)
        (block
          (i32.const 0)
          (loop
            (i32.const 0)
            (call_indirect (type 0) (i32.const 0))
            br 1
          )
        )
      )
    )
  )
  "type mismatch"
)