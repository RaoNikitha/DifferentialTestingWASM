;; 5. **Test Description**: Module A contains a sequence involving multiple calls to module B interspersed with `nop` instructions. Check if the alternation between `nop` and cross-module calls consistently maintains the correct stack and control flow.

(assert_invalid
  (module 
    (import "B" "func-i32" (func $b_func (result i32))) 
    (func $a_func (call $b_func) nop (call $b_func))
  )
  "type mismatch"
)