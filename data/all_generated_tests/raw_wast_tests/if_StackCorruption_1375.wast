;; 6. **Test Description**:    Implement an `if` block that calls a function within both `then` and `else` branches, each function modifying the stack in different nested ways. Confirm the correct stack cleanup ensuring no stack corruption upon `if` block exit.

(assert_invalid
  (module
    (func $nested_stack_clean (param i32) (result i32)
      (if (param i32) (result i32)
        (local.get 0)
        (then
          (call $push_stack)
        )
        (else
          (call $modify_stack)
        )
      )
    )
    (func $push_stack (drop))
    (func $modify_stack (nop))
  )
  "type mismatch"
)