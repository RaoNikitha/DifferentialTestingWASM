;; 10. **Loop with Alignment Issues in Argument Stack Depth**: Create a loop where the stack depth varies unpredictably before the call instruction, leading to potential misaligned arguments for the function being called. This scenario tests robustness against stack depth inconsistencies within loops.

(assert_invalid
  (module
    (func $stack-alignment-loop
      (i32.const 1)
      (loop
        (i32.const 2)
        (call 1)
      )
    )
    (func (param i32))
  )
  "type mismatch"
)