;; 6. Develop a nested function call scenario where an imported function calls back into a function exported by the same module. This will stress-test the round-trip of control flow and verify that the stack is correctly preserved and restored during these transitions.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (param i32) (result i32)))
    (func $internalFunc (param i32) (result i32)
      local.get 0
      call $externalFunc
    )
    (func (result i32)
      i32.const 42
      call $internalFunc
    )
    (export "internalFunc" (func $internalFunc))
  )
  "type mismatch"
)