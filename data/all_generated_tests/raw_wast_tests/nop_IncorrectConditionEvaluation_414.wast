;; 5. Precede a `br_if` bound to a non-zero condition with a `nop`. Verify whether the `br_if` correctly branches when the condition is true, checking for any incorrect behavior due to `nop`.

 ;; (module (func (block (nop) (br_if 0 (i32.const 1)) (unreachable))))