;; 10. **Test Mixed Stack Operations with `call` Instructions:**    - Build a test where a `br` instruction is combined with `call` instructions within nested control structures. Ensure that operand stack operations are correctly managed across these function calls, maintaining valid stack states.

(assert_invalid
  (module
    (func $nested_call_stack_management
      (block
        (call $dummy_func)
        (block
          (call $dummy_func)
          (br 1)
        )
        (i32.const 1)
      )
    )
    (func $dummy_func)
  )
  "type mismatch"
)