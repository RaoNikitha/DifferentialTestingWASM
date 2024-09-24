;; Test indirect function calls with polymorphic type sequences. Ensure that the sequence mismatch in function signatures leads the execution control to hit an `unreachable` instruction due to improper conformity to function type specifications.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (result f32) (i32.const 42))
    (func (call_indirect (type 0) (i32.const 0) (i32.const 7)))
  )
  "type mismatch"
)