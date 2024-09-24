;; 8. **Test Description 8:** Introduce `unreachable` inside a deeply nested set of `control` structures like `block`, `loop`, and `if`, where each subsequent structure expects increasingly complex stack results. This complicates type enforcement genuinely ensuring the polmorphism is correctly handled.

(assert_invalid
  (module (func $complex-unreachable (result i32)
    (block (result i32)
      (loop (result i32)
        (if (result i32) (i32.const 1)
          (unreachable)
        )
        (i32.const 0)
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)