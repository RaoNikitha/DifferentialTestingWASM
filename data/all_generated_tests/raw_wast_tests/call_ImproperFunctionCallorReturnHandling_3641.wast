;; Implement a sequence where an imported function is called with an index outside the valid range of the function table in the WebAssembly module, ensuring the WebAssembly error handling gives an unknown function error message. Examine if wizard_engine either improperly calls or fails silently without specific error handling.

(assert_invalid
 (module
  (import "env" "external_func" (func $external_func (param i32)))
  (func (call 1 (i32.const 10)))
 )
 "unknown function"
)