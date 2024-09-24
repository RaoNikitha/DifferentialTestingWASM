;; 2. Ensure that multiple nested function calls correctly handle the operand stack on return. Check if an intermediate function incorrectly retains stack values in Wizard Engine in cases where WebAssembly unwinds the stack to match the function's return type.

(assert_invalid
  (module
    (func $intermediate (result i32)
      (i32.const 1)
      (i32.const 2)
      (return)
    )
    (func $outer (result i32)
      (call $intermediate)
      (i32.const 3)
    )
  )
  "type mismatch"
)