;; Test 4: Design a loop that calls a function with multiple arguments and return values. Check if the arguments are consumed and results are pushed correctly on the stack, ensuring that loop termination conditions are respected to avoid infinite loops.

(assert_invalid
  (module
    (func $multi-arg-return-loop
      (loop
        (call 1 (i32.const 3) (i64.const 7))
        (br_if 0 (i32.const 0))
      )
    )
    (func (param i32 i64) (result i32 i64))
  )
  "type mismatch"
)