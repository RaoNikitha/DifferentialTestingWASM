;; 8. **Test Non-Matching Stack Polymorphism Requirements:**    - Execute a `br` where the label target has specific stack requirements differing from the current stack state. Ensures the operand stack unwinds properly to match the label's requirements.

(assert_invalid
  (module
    (func $non_matching_stack_polymorphism
      (block (result i32)
        (i32.const 1)
        (block (result i32 i32)
          (i32.const 2) (i32.const 3)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)