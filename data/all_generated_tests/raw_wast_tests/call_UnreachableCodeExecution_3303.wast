;; 2. **Test Description**: Use `if-else` conditions with an incorrect branch that leads to calling a function. The `else` branch should end with an `unreachable` instruction to validate if stack operations correctly lead to a trap.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $cond-call (param $0 i32) (result i32)
      (if (param i32) (result i32)
        (i32.const 1)
        (call $func (i32.const 1))
        (then (i32.const 0))
        (else (unreachable))
      )
    )
    (func $func (param i32) (result i32)
      (local.get 0)
    )
  )
  "type mismatch"
)