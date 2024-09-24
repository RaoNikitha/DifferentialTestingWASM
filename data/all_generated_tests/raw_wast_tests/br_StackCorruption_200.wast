;; 1. Test Description: Construct a WebAssembly module with a nested loop structure, where the inner loop contains a `br` instruction referencing an outer loop. Ensure the stack has multiple values at various depths before the `br` execution. Verify that the stack is correctly unwound and check for underflows that `wizard_engine` might mishandle.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block (br 1))
        )
      )
    )
  )
  "unknown label"
)