;; 10. Test Description: Use a `block` containing a `br_table` with multi-value target indices, testing the handling of multiple results. Confirm if `WebAssembly` maintains conformance to multi-value standards, and observe if `wizard_engine` deviates in its implementation.

(assert_invalid
  (module (func $block-br_table-multivalue-targets
    (block (result i32 f64)
      (block (result i32 f64)
        (br_table 0 (i32.const 10) (f64.const 20.0))
      )
      (i32.const 1) (f64.const 2.0)
    )
  ))
  "type mismatch"
)