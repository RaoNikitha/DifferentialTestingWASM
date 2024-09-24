;; 4. **Test Name: Implicit Stack Growth**    - **Description**: Use a sequence within `if` blocks where the stack is unexpectedly grown by nested blocks or function calls, ensuring any subsequent stack matching correctly accounts for this dynamic growth.      ```wasm      (i32.const 1) (if (result i32) (block (nop)) (i32.const 2) else (i32.const 0) end)      ```    - **Reasoning**: Ensures the `if` statement properly integrates any nested stack manipulation operations’ side effects.

(assert_invalid
  (module (func $implicit-stack-growth
    (i32.const 1)
    (if (result i32)
      (block (nop))
      (i32.const 2)
      else
      (i32.const 0)
    end)
  ))
  "type mismatch"
)