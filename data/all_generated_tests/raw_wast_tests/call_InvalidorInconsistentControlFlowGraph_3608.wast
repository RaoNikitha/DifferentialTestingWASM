;; 7. **Test Call Within Conditional Branch**:    - **Description**: Use a `call x` instruction within an `if` block where the condition is never true.    - **Constraint**: The `call` instruction should not be executed if the condition is false.    - **Relation to CFG**: An incorrect CFG might not handle the condition properly, potentially executing unreachable calls.

(assert_invalid
  (module
    (type (func))
    (func (result i32)
      (if (i32.const 0)
        (then 
          (call 0)
          (i32.const 1)
        )
        (else 
          (i32.const 0)
        )
      )
    )
  )
  "unknown function"
)