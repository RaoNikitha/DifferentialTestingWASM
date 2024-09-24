;; 7. **Mixing Operand Types in Loop Body:**    - Write a `loop` that expects a stack operand of type `f64` but receives an `i32` before the `br` back to loop start. This evaluates if the implementation correctly matches loop back branch operand types.

(assert_invalid
  (module
    (func $mismatched-loop-operand
      (loop $L (f64)
        (i32.const 42)
        (br $L)
      )
    )
  )
  "type mismatch"
)