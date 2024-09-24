;; 2. Test Description: Include a `br` instruction within a deeply nested control structure that branches out of a `block` into a function return operation. This ensures that the stack unwinding correctly matches the target function's return type.

(assert_invalid
  (module 
    (func (result i32)
      (block 
        (block 
          (br 1)
          (i32.const 0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)