;; 1. Insert a `nop` instruction immediately before a `call` instruction to verify if the function call sequence remains unaffected and the correct function is invoked, ensuring `nop` does not alter the execution flow.

(assert_malformed
  (module
    (func $test
      (nop)
      (call 0)
    )
    (func (export "target") (nop))
  )
  "unexpected token"
)