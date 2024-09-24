;; 1. **Test Description**: Create two WebAssembly modules, Module A and Module B. Module A exports a function that includes a sequence of instructions with several `nop` instructions spread throughout the function. Module B imports and calls this exported function from Module A. Verify that the call to the imported function from Module B, along with the presence of `nop` instructions, does not alter the control flow or produce unexpected results.

(assert_invalid
  (module
    (import "moduleA" "exportedFunc" (func $importedFunc))
    (func (export "testFunc") (call $importedFunc) (nop) (i32.const 0) (nop) (drop))
  )
  "unexpected result"
)