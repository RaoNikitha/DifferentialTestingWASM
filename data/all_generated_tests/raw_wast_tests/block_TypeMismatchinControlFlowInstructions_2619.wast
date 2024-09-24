;; 10. **Mixed Value Types in Execution**: Create a `block` having a result type of `i32` but execute a series of instructions that mix `i32` and `f32` values in an inconsistent manner, leading to a final type mismatch. This checks if the implementations can accurately track and enforce types during complex instruction sequences.

(assert_invalid
  (module (func $mixed-value-types (result i32)
    (block (result i32)
      (i32.const 10)
      (f32.const 5.0)
      (i32.add)
    )
  ))
  "type mismatch"
)