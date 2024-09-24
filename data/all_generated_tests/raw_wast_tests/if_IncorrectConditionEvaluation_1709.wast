;; 10. Test an `if` instruction using a series of complex logical operations for its condition, where `WebAssembly Validator` correctly branches to `else` upon condition being false, but `Wizard Engine` enters `then` due to control state mishap.

(assert_invalid
  (module (func $logical-ops-if-bug
    ;; Complex logical condition
    (i32.or (i32.and (i32.const 0) (i32.xor (i32.const 1) (i32.const 0))) (i32.const 0))
    (if (result i32) (then (i32.const 1)) (else (i32.const 2)))
  ))
  "type mismatch"
)