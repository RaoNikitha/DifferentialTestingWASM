;; 7. **Invalid Operand Type for `loop` Block Start**: Insert a loop that expects an integer value on the stack at the start (according to its declared block type), but push a float before entering the loop. This will test if the entry operand type constraints are enforced.

(assert_invalid
  (module (func
    (f32.const 0.0)
    (loop (param i32) (drop))
  ))
  "type mismatch"
)