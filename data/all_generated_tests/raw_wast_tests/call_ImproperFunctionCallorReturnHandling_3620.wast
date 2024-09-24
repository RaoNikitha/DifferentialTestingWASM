;; 9. Design a module where a function calls an external (imported) function and the external function throws an error. Verify that the calling function correctly propagates and handles the thrown error.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (call $external_func))
  )
  "unknown function"
)