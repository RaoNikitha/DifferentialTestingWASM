;; Test a recursive function call that exhaustively consumes the stack. This verifies how each implementation manages the stack and prevents stack overflow in a recursive scenario.

(assert_invalid
  (module
    (func $recursive (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.sub
      local.tee 0
      i32.const 0
      i32.ge_s
      if (result i32)
        local.get 0
        call $recursive
      else
        i32.const 1
      end
    )
    (func (export "start") (call $recursive (i32.const 1000000)))
  )
  "stack overflow"
)