;; 9. Design a block where a branching condition in `br_if` involves a floating-point comparison (`f32.eq`). This ensures that condition evaluations involving different data types are properly handled.

(assert_invalid
  (module (func $br_if-f32-eq
    (block (result i32)
      (br_if 0 (f32.eq (f32.const 1.0) (f32.const 1.0)) (i32.const 42))
    )
  ))
  "type mismatch"
)