;; - Test 8: Create a reinitialization test where `Wizard Engine` fails to reinitialize loop execution correctly on `br`, leading to endless looping compared to `WebAssembly`'s intended behavior.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (i32.const 0)
        (br 0)
      )
      (drop)
      (i32.const 1)
    )
  )
  "unreachable code after reinitialization"
)