;; 3. **Test Description**: Design a function in module A with several `nop` instructions followed by a conditional call to an imported function in module B. Ensure this conditional branch functions correctly, as improper handling of `nop` could disrupt the control flow.

(assert_invalid
  (module
    (import "moduleB" "importedFunc" (func $importedFunc))
    (func $testFunc
      nop
      nop
      i32.const 1
      if (then
        call $importedFunc
      )
    )
  )
  "unexpected end of section or function: missing result type"
)