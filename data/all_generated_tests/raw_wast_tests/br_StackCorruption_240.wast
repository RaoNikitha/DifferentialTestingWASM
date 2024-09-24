;; 1. **Test Description**: Create a sequence of nested `loop` blocks where each loop has different operand stack heights. Perform a `br` to an outer loop to see if the operand stack unwinding is correctly handled in both implementations.

(assert_invalid
  (module
    (func $nested-loops-unwind-stack
      (loop (result i32)
        (i32.const 1)  ;; Stack height 1
        (loop
          (i32.const 2)  ;; Stack height 2
          (loop
            (i32.const 3)  ;; Stack height 3
            (br 2)  ;; Branch to outermost loop
          )
        )
      )
    )
  )
  "type mismatch"
)