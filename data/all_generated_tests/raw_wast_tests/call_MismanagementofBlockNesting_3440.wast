;; 9. **Test 9**: Design an inner nested loop that includes a `call` instruction returning types while the surrounding blocks manipulate different stack values. Inspect if values being pushed and popped are consistently managed when exiting nested loops.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $outer-loop
      (loop $outer
        (i32.const 1)
        (call 0)
        (loop $inner
          (call 0)
          (i32.add)
          (br_if $outer (i32.const 0))
        )
        (br_if $outer (i32.const 0))
      )
    )
    (func (param i32) (result i32) (i32.const 0))
  )
  "type mismatch"
)