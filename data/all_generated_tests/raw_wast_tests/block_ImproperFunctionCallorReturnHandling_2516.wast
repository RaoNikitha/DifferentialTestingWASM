;; Develop a block that performs a `call` to a function, followed immediately by an improper type `return`, examining how the implementations handle unexpected type transitions and operand stack states after the return.

(assert_invalid
  (module 
    (func $func1 (result i32) (i32.const 42))
    (func $invalid-return
      (block (result i32)
        (call $func1)
        (return (f64.const 3.14))
      )
    )
  )
  "type mismatch"
)