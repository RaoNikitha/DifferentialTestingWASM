;; - Establish a `loop` where a `call` instruction is placed at different nesting levels. Validate the handling of the operand stack and proper context extension at each level, checking for consistent operand type verification.

(assert_invalid
  (module
    (func $type-loop-call (param i32) (result i32)
      (local i32)
      (loop (result i32)
        (local.get 0)
        (i32.const 1)
        (i32.add)
        (call $type-loop-call) ;; Call within loop block
      )
    )
    (func $type-loop-call-outer (result i32)
      (i32.const 5)
      (loop (result i32)
        (call $type-loop-call) ;; Call within loop block
      )
    )
  )
  "type mismatch"
)