;; 9. Place `nop` between two `call` instructions and assess if the control transfers correctly between the two function calls.    **Constraint:** Ensure `nop` doesn’t modify the call sequence control flow.

(assert_invalid
  (module
    (func $f1 (nop) (call $f2))
    (func $f2)
    (func (call $f1) (nop) (call $f2)))
)