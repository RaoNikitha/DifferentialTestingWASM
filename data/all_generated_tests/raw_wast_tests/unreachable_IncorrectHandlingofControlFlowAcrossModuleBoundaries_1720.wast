;; 1. Define a WebAssembly module (`Module A`) that exports a function containing an `unreachable` instruction followed by an `i32.const` instruction. Import and call this function from another module (`Module B`). Check if `Module B` properly traps immediately on the call to the exported function, without executing further instructions in `Module B`.

 ;; (module
  (func $exported (export "test_unreachable")
    unreachable
    i32.const 10
  )
)

(assert_invalid
  (module
    (import "env" "test_unreachable" (func $test_unreachable))
    (func (call $test_unreachable) (i32.const 1) drop)
  )
  "type mismatch"
)