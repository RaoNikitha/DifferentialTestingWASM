;; 1. **Unreachable Code Inside Loop**:    - Create a test with a `loop` containing code that is unreachable due to a preceding `br` instruction. Check if the CFG correctly identifies the unreachable code.    - **Constraint**: Verify if the context handling properly marks subsequent instructions as unreachable.    - **CFG Check**: The CFG should not include paths through the unreachable code segment.

(assert_invalid
  (module (func $unreachable-code-inside-loop
    (loop (result i32)
      (br 0)
      (i32.const 0)
      (unreachable)
    )
  ))
  "type mismatch"
)