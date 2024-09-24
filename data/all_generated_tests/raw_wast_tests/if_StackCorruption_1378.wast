;; 9. **Test Description**:    Develop an `if` instruction where the `then` branch manipulates floating point types in depth, and the `else` branch uses integer manipulation of multiple values. Verify proper type management and stack clearance.

(assert_invalid
  (module (func $if-float-int-manip
    (i32.const 1)
    (if (result f32)
      (then
        (f32.const 3.14)
        (f32.add)
      )
      (else
        (i32.const 42)
        (i32.mul)
      )
    )
  ))
  "type mismatch"
)