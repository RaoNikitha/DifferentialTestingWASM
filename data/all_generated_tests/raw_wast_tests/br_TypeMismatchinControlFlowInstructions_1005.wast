;; 6. **Unwinding Stack with Incorrect Types:**    - Construct a `block` that starts with an `i64` on the operand stack. Inside, place values of type `i32` and a `br` that consumes these values. Check whether the stack is correctly unwound and type-checked after the `br` instruction.

(assert_invalid
  (module
    (func $unwind-stack-incorrect-type
      (block (result i32)
        (i64.const 0)
        (i32.const 1)
        (i32.const 2)
        (br 0)
      )
    )
  )
  "type mismatch"
)