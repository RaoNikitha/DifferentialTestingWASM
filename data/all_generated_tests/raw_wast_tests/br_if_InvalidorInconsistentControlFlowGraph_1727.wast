;; 8. **Nested Loop Exit Through `br_if`**:    - **Description**: Create nested `loops` and insert `br_if` in the innermost loop targeting an outer `loop`, with incorrect operand stack types.    - **Constraint**: Proper operand types on stack unwind.    - **CFG Impact**: Incorrect stack unwind may lead to improper loop exits, misconfiguring CFG paths.

(assert_invalid
  (module (func $nested-loop-exit-br_if
    (loop (loop (br_if 1 (i32.const 1) (f32.const 0.0))))
  ))
  "type mismatch"
)