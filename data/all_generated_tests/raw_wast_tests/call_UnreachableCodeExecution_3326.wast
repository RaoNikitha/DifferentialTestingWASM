;; 5. **Test Description**:     - **Setup**: Define a function `foo` which calls `bar` using an incorrect parameter that should lead to an `unreachable` instruction within `bar` due to type inconsistency.    - **Constraint**: Triggering a trap due to type mismatch leading to unreachable.    - **Reasoning**: Tests type-checking consistency and execution leading to unreachable.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $bar (param i32)
      (unreachable)
    )
    (func $foo
      (call $bar (nop))
    )
  )
  "type mismatch"
)