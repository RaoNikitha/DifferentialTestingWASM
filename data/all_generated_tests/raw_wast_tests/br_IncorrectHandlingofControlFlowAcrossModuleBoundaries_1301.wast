;; 2. **Test Description 2**:    Implement a nested `if` structure within a function imported from another module and use a `br` instruction to jump to a label outside the nested `if`. Validate that the proper label is targeted and the operand stack is correctly managed.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func (result i32)
      (block (result i32)
        (i32.const 42)
        (if (result i32)
          (then
            (if (result i32)
              (then
                (call $externalFunc)
                (br 1)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)