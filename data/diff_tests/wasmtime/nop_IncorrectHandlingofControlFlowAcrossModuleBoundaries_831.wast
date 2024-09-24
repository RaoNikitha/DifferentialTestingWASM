;; 2. Develop a nested module scenario where the main module calls an imported function, which internally performs multiple `call` instructions to other functions (both local and imported). Insert `nop` instructions before and after each `call` in the imported function to test if `nop` is ignored properly across nested control flows and multiple module transitions.

(assert_invalid
  (module
    (import "env" "importedFunc" (func $importedFunc))
    (func $localFunc1 (nop) call $importedFunc (nop))
    (func $localFunc2 (nop) call $localFunc1 (nop))
    (func $main (nop) call $localFunc2 (nop))
  )
  "type mismatch"
)