;; 8. **Test Description**: Create a function that accepts parameters through its operand stack, performs calculations, has multiple return points, and export it. Import and call this function from another module, checking the operand stack state after the call.

(assert_invalid
  (module
    (func $complex-return (param i32 i32) (result i32)
      local.get 0
      local.get 1
      i32.add
      block (result i32)
        local.get 0
        br_if 0
        return (i32.const 0)
      end
    )
  )
  "type mismatch"
)