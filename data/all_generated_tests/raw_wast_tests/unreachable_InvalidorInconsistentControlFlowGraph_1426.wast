;; Test 7: Employ `unreachable` interspersed between function calls that affect the stack, like pushing values followed by calls to another function. It tests if type contexts for calls are correctly invalidated upon trap.

(assert_invalid
  (module
    (func $test (param i32 i32) (result i32)
      local.get 0
      local.get 1
      call $helper
      unreachable
      (i32.const 42)
    )
    (func $helper (param i32 i32) (result i32)
      local.get 0
    )
  )
  "type mismatch"
)