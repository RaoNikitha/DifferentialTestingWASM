;; 9. Develop a `loop` where an inner `loop`'s `br_if` condition does not correctly pop the required operand, causing stack imbalance. Test if `WebAssembly` raises an error using `check_seq` whilst `wizard_engine` results in infinite loop due to stack mismanagement.

(assert_invalid
  (module
    (func $differential-test
      (i32.const 1)
      (loop (result i32)
        (loop (result i32)
          (br_if 1) ;; This conditional branch should pop the i32.const 1
        )
      )
    )
  )
  "stack mismatch"
)