;; 1. Insert a `nop` instruction at the beginning of a `block` that expects a specific type on the stack. Ensure the surrounding instructions manipulate the stack to intentionally mismatch types at block boundaries. Check if validation fails in wizard_engine, indicating a type mismatch.

(assert_invalid
  (module
    (func
      (block (result i32)
        (nop)
        (i32.const 0)
        (br 0)
      )
      (unreachable)
    )
  )
  "type mismatch"
)