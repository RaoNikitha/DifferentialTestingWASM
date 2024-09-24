;; 3. Create a scenario where a function imported from another module is called with an incorrect index beyond its actual range. Test if the implementation catches this out-of-bounds error and handles it gracefully, notifying about the "unknown function" as per the WebAssembly implementation.

(assert_invalid
  (module
    (import "env" "external_func" (func $imported_func))
    (func (call 99))
  )
  "unknown function"
)