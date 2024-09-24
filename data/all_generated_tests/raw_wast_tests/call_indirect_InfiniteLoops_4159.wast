;; Test 8: Construct a scenario where a loop includes a sequence of instructions ending with `call_indirect`, and the function type is checked dynamically. If a type mismatch exists, check if the loop fails to progress to the next iteration, causing an infinite loop.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table funcref (elem $f))
    (func $loop-with-call-indirect
      (loop
        (call_indirect (type 0) (i32.const 0))
        (br_if 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)