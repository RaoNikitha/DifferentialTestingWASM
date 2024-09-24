;; 9. **Test 9**: Implement a function that calls another function containing a `br` to an invalid label. Invoke the outer function and check whether the WebAssembly implementation properly traps due to the invalid branch target, ensuring comparison with the Wizard_engine's error handling.

(assert_invalid
  (module
    (func $inner (br 1))
    (func $outer (call $inner))
    (start $outer)
  )
  "invalid label"
)