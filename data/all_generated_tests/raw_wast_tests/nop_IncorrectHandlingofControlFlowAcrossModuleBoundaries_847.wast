;; 8. **Test Description**: Construct a function in module A with a `nop` instruction at the beginning, then call a function from module B that throws a trap. Ensure the `nop` correctly does nothing, and the trap is properly handled without any side-effects from the `nop`.

(assert_malformed
  (module 
    (func (export "funcA") (nop) 
      (call $funcB))

    (import "moduleB" "funcB" (func $funcB))
  )
  "unknown import"
)