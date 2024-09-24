;; 9. Generate a function that indirectly calls itself through multiple other functions using valid and invalid indices alternatively. This tests if WebAssembly catches backward references properly to avoid infinite recursion, whereas `wizard_engine` might demonstrate infinite loop issues.

(assert_invalid
  (module
    (func $f0 (result i32) (call $f1) (i32.const 0))
    (func $f1 (result i32) (call $f2) (i32.const 0))
    (func $f2 (result i32) (call $f0) (i32.const 0))
    (func)
    (func (call 3 (call 0)))
    (func)
  )
  "type mismatch"
)