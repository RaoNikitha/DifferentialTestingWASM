;; 4. **Test Description:**    - Develop a module with a deeply nested `block` and `loop`, where an inner `br` instruction branches out of the `loop` to a `block` expecting different types (e.g., floats instead of integers).    - **Constraint Check:** This test ensures the operand stack unwinding and type restoration across branches are handled correctly.    - **Differential Behavior:** WebAssembly's strict typing mechanism should immediately identify and halt execution on type mismatch, while Wizard Engine might incorrectly allow execution if the verbose label handling is faulty.

(assert_invalid
  (module
    (func $nested-block-loop-mismatch
      (block (result f32)
        (loop (block (result f32)
          (br 1 (i32.const 42))
        ))
      )
    )
  )
  "type mismatch"
)