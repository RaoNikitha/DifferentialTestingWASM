;; 10. Implement a `loop` with mixed operations on multiple values types, switching between integers, floats, and references. Validate that the stack alignment is correctly managed across type borders, preventing stack corruption when looping.

(assert_invalid
  (module (func $mixed-types-loop
    (f32.const 0.0) (i32.const 42) 
    (loop (param f32 i32) 
      (i32.const 1) (i32.add) 
      (f32.const 1.5) 
      (drop) (br 0)
    )
  ))
  "type mismatch"
)