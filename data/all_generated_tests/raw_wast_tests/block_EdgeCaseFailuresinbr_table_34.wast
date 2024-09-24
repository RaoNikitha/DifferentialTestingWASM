;; 5. Test Description: Place a `br_table` within a `block` that exerts an index to target a non-existent label (e.g., beyond the number of blocks available), ensuring `WebAssembly` throws an error and determine if `wizard_engine` fails to recognize the invalid target.

(assert_invalid
  (module (func
    (block (result i32)
      (br_table 1 (i32.const 0))
    )
  ))
  "invalid label"
)