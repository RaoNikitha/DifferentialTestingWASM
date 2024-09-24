;; 3. Develop a WebAssembly module (`Module A`) that exports a function containing an `unreachable` instruction at the beginning. Import and invoke this function from another module (`Module B`), where `Module B` has additional instructions expected not to execute post-call. Confirm `Module B` traps correctly when transitioning from the call to the imported `unreachable`, reflecting appropriate control flow handling.

(assert_invalid
  (module
    (import "A" "trap" (func $trapFn))
    (func (call $trapFn) (i32.add (i32.const 1) (i32.const 2)))
  )
  "unreachable executed"
)