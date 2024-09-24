;; 5. **Test Description**: Call a function while providing more arguments than expected, testing how each engine manages stack operations and whether this mismanagement leads to reaching an 'unreachable' instruction.

(assert_invalid
  (module
    (type $t (func (param i32) (result i32)))
    (func $f (type $t) (i32.const 42))
    (func (call $f (i32.const 10) (i32.const 20)))
  )
  "type mismatch"
)