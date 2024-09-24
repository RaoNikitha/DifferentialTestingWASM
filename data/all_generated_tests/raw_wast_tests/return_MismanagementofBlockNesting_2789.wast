;; Test 8: Develop a function with nested control flow structures (`block`, `loop`, `if-else`), where operands depend on complex conditions. Insert a `return` to test whether the interpreter correctly identifies the stack-persistent operands and unwinds to the appropriate state.

(assert_invalid
  (module
    (func $nested-control-flow (result i32)
      (block $outer 
        (block $inner 
          (i32.const 42)
          (loop $loop 
            (i32.const 99)
            (if (i32.eq (i32.const 1) (i32.const 1))
              (then (return))
              (else (i32.const 100))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)