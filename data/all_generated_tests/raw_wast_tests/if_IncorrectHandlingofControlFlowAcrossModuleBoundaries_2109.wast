;; A test using multiple `if` instructions in different modules, each calling a function from another module inside their respective `then` or `else` blocks, thereby ensuring cascaded cross-module calls manage the operand stack and control flow accurately when these calls interleave and return.

(assert_invalid
  (module 
    (import "mod1" "func1" (func $func1 (result i32)))
    (func (result i32)
      (if (result i32) (call $func1)
        (then (if (result i32) (call $func1)
          (then (i32.const 1))
          (else (call $func1))
        ))
        (else (if (result i32) (call $func1)
          (then (call $func1))
          (else (i32.const 0))
        ))
      )
    )
  )
  "type mismatch"
)