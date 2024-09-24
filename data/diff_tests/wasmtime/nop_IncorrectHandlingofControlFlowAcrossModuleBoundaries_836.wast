;; 7. Design a pair of modules where the first module imports a function, calls it, and then performs a `return` instruction interspersed with `nop`. The called function in the second module should modify the stack. This test checks if the `nop` is properly handled without causing incorrect returning behavior or stack corruption.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc (result i32)))
    (func (result i32)
      (call $externalFunc)
      (nop)
      (return)
      (nop)
      (i32.const 0)))
  "type mismatch"
)