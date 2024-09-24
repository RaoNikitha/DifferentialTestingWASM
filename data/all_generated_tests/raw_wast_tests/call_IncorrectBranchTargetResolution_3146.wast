;; 5. **Test 5**: Include a function in the module that mixes `br` instructions with `return` values that lead to invalid branch targets. Trigger this function to see if the WebAssembly implementation consistently produces an appropriate error while the Wizard_engine might not.

(assert_invalid
  (module
    (func $f (param i32) (result i32)
      (block $label0
        (br $label0 (return (i32.const 0)))
      )
    )
    (start $f)
  )
  "invalid branch target"
)