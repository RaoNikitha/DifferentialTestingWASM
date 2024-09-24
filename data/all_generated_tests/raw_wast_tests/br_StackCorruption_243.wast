;; 4. **Test Description**: Design a `loop` containing multiple stack push-pop instructions and a `br` to another `loop` with different operand stack requirements to see if the implementations correctly handle stack unwinding without corruption.

(assert_invalid
  (module
    (func $test
      (block $outer
        (loop $inner
          (i32.const 10)  ;; Push value to stack
          (i64.const 20)  ;; Push another value to stack
          (br $outer)     ;; Branch to outer block
        )
      )
      (loop $second
        (drop)           ;; Pop value from stack
        (drop)           ;; Pop another value from stack
        (i32.const 30)
        (br $inner)      ;; Branch to inner loop
      )
    )
  )
  "type mismatch"
)