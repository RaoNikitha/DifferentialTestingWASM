;; 8. **Test 8**: Create a recursive function with `br` instructions pointing to an invalid recursive depth. Call this function, ensuring that WebAssembly traps due to incorrect branch target resolution, while comparing how the Wizard_engine might handle such cases.

(assert_invalid
  (module
    (func $recursive (result i32)
      (local i32)
      (set_local 0 (i32.const 42))
      (br 2)
      (call 0)
    )
  )
  "invalid branch depth"
)