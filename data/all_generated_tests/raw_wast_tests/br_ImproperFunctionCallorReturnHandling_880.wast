;; 1. Test a `br` instruction within a function that incorrectly targets a non-existent label in WebAssembly causing a failure, but wizard_engine handles this without raising an error.

(assert_invalid
  (module (func $invalid-target-br
    (block (br 3 (i32.const 1)))
  ))
  "unknown label"
)