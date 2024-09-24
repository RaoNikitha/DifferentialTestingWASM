;; 5. Design a WebAssembly module (`Module A`) to export a function that calls an imported function, followed by an `unreachable` instruction. In another module (`Module B`), implement this function to perform routine computation. Upon importing `Module A` and executing the function call, ensure that `Module B` traps once it hits the `unreachable` instruction.

(assert_invalid
  (module
    (func (export "call_unreachable")
      (call 0)
      (unreachable)
    )
    (func
      (import "moduleB" "routine_computation")
    )
  )
  "export function must trap as unreachable is executed"
)