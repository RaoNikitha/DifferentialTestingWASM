;; 3. **Test Description**: Invoke a function that should return multiple values, but alter the function signature to return fewer values. This mismatch should cause execution to erroneously reach an 'unreachable' statement.

(assert_invalid
  (module
    (type $sig (func (result i32 i32 i32)))
    (func $test (result i32 i32) (call 0))
    (func $f (type $sig) (i32.const 1) (i32.const 2) (i32.const 3))
  )
  "type mismatch"
)