;; 1. **Test Name: Out-of-Bound Label Index**    **Description:** Create a `br_if` instruction that attempts to use a label index that exceeds the available depth of nested control structures. This should trigger an `OobLabel` error in `wizard_engine` but would likely be handled generically as an invalid operation in WASM.    **Infinite Loop Relation:** If the error is not properly caught, the loop might not be exited correctly, leading to infinite execution.

(assert_invalid
  (module (func $out_of_bound_label (result i32)
    (block (result i32)
      (br_if 2 (i32.const 1)) (i32.const 0)
    )
  ))
  "unknown label"
)