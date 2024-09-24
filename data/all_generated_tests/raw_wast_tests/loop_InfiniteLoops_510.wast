;; 1. Test a `loop` instruction where the `blocktype` is incorrectly defined, causing `WebAssembly` to raise an error using `require` but `wizard_engine` may mishandle the error leading to an infinite loop due to improper constraint validation.

(assert_invalid
  (module (func $test_malformed_loop
    (loop (param i32) (i32.const 1) (drop))
  ))
  "type mismatch"
)