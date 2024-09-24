;; 7. **Nested Function Calls with Break:**    Nested function calls with an internal `br` designed to break out of the outermost block while preserving the function call return values. Examine if the control logic and operand stack are correctly maintained after the branches.

(assert_invalid
  (module (func $nested-func-calls-break
    (result i32)
    (block $outer
      (call $inner-func)
      (br 0)
    )
  (func $inner-func
    (result i32)
    (i32.const 42)
    (block
      (br 1)
    )
    (drop)
  ))
  "type mismatch"
)