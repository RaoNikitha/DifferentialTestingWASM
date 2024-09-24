;; 8. Write a WebAssembly function with consecutive `if` statements where the condition leads to a `br` that targets the parent `block`. Insert an `unreachable` instruction immediately after the `br` and check if the function correctly resolves the control flow, avoiding execution of unreachable code.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (if (i32.const 1) (br 0))
        (unreachable)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)