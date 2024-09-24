;; 5. **Incorrect Loop Continuation Type**:    - **Description**: Define a loop accepting `f32` inputs and use a `br_if` to loop with `i32` instead, expecting a type mismatch error.    - **Constraint**: Confirms loop input types are validated during conditional branch.    - **Differential Behavior**: WASM catches the type mismatch, wizard_engine might struggle with state tracking and incorrect type propagation.

(assert_invalid
  (module (func $incorrect-loop-continuation-type
    (loop (param f32)
      (br_if 0 (i32.const 1))
    )
  ))
  "type mismatch"
)