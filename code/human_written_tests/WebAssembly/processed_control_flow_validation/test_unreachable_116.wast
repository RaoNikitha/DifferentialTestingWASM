(assert_invalid
  (module (func (result i32) (unreachable) (select (i64.const 1) (i32.const 1))))
  "type mismatch"
)