;; 1. Generate a WebAssembly module with an `if` instruction where the operand stack has an edge case with the condition pushing value not of type `i32`, and include a `br_table` that has indices out of bounds within both `then` and `else` branches.

(assert_invalid
  (module
    (func (result i32)
      (i32.const 10) 
      (if (result i32)
        (f32.const 0.0)  ; Incorrect type for condition
        (then
          (br_table 0 1 2 (local.get 0))  ; Out of bounds branch table
          (i32.const 1)
        )
        (else
          (br_table 0 1 2 (local.get 0))  ; Out of bounds branch table
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)