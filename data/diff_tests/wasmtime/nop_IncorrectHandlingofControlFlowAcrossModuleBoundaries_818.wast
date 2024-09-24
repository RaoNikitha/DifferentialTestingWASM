;; 9. **Test Description**: Construct a scenario where a function in Module A calls another function within the same module which includes a series of `nop` instructions. Then, Module B imports and calls the initial function from Module A, validating that `nop` instructions don’t disrupt nested function calls and control flow integrity.

(assert_invalid
  (module
    (import "moduleA" "funcA" (func $funcA))
    (func $call_funcA (call $funcA)))
  "function import/export type mismatch"
)