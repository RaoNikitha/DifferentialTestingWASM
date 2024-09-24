;; Create a function that has mismatched parameter and return types (e.g., expected float but provided integer) and invoke it with correct and incorrect types in separate test cases. Verify if type mismatches are equally handled or if one engine fails to trap.

(assert_invalid
  (module
    (type (func (param i32) (result f64)))
    (func $mismatch-type (call 0 (f32.const 1.0)))
    (func (param i32) (result f64))
  )
  "type mismatch"
)