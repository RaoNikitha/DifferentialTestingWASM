;; 6. A sequence of function calls with a `br` instruction targeting a label outside of the function's scope, examining if WebAssembly incorrectly returns to an improper function frame compared to wizard_engine.

(assert_invalid
  (module
    (func $func1
      (block (br 1))
    )
    (func $func2 (call $func1))
  )
  "unknown label"
)