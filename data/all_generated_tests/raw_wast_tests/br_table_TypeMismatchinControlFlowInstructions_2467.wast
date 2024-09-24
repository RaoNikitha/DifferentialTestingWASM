;; 7. **Test Description**: Design a block that starts with a `br_table`, with label targets having mixed expected types of `i32` and `i64`, and an operand stack set to `f32`.

(assert_invalid
  (module (func $mixed-expected-types
    (block (br_table 0 1 2 (f32.const 0.0)))
  ))
  "type mismatch"
)