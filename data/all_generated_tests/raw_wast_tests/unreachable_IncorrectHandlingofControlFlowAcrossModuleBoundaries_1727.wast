;; 8. Construct a WebAssembly module (`Module A`) with a loop containing an `unreachable` instruction. Export this function and call it from another module (`Module B`) within another loop context. Validate the transition ensuring `Module B` traps reliably, confirming consistent control flow across module boundaries and correctly handling the stack.

(assert_invalid
  (module
    (func $A (loop (unreachable)))
    (export "funcA" (func $A))
    (import "module" "funcA" (func $B))
    (func (call $B) (loop))
  )
  "type mismatch"
)