;; 4. Introduce a test with a valid table index but the return type of the called function does not match the expected return type by `typeidx`. This ensures that return type mismatches are properly trapped.

(assert_invalid
  (module
    (type (func (result i32)))
    (func $f (result f32) (f32.const 0.0))
    (table funcref (elem $f))
    (func $return-type-mismatch (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)