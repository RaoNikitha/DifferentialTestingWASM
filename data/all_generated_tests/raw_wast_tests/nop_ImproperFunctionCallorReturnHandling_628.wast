;; 9. Include a `nop` within a function that performs an indirect recursive call via `call_indirect`, calling itself repeatedly. Verify that the recursion depth and return values remain correct, ensuring the `nop` does not introduce any state corruption or improper behavior.

(assert_invalid
  (module
    (type $t (func (result i32)))
    (func $f (result i32) (nop) (call_indirect (type $t) (i32.const 0)))
    (table anyfunc (elem $f))
    (start $f))
  "type mismatch"
)