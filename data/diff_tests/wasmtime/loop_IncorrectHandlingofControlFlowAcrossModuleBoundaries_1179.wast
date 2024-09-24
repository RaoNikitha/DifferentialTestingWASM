;; 10. Test a loop that contains a branch to a re-exported function from another module, which in turn enters its own loop with `br` instruction. Ensure proper handling of control flow and stack consistency during nested and cross-module calls.

(assert_invalid
  (module
    (import "m" "f" (func $imported_func))
    (func $test_func (loop (block (br 0)) (call $imported_func) (br 1)))
    (export "test_exported_func" (func $test_func))
  )
  "invalid branch target"
)