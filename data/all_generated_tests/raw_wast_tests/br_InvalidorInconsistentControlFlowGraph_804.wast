;; 5. **Unwinding Operand Stack Depth Mismatch Test:**    Construct a nested block structure where a `br` instruction targets a block with a different operand stack depth requirement than the current stack depth. This detects how the implementation handles stack depth mismatches upon branching.

(assert_invalid
  (module
    (func 
      (block 
        (i32.const 1)
        (block (result i32)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)