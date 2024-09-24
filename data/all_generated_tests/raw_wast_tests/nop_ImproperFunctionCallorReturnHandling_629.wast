;; 10. Construct a test where a `nop` is placed before a function return, within a function that is called multiple times in succession. Verify that the return values are consistent and correct each time, confirming that the `nop` instruction does not impact the return handling.

(assert_invalid
  (module (func (result i32) (nop) (return (i32.const 42))))
  "type mismatch"
)