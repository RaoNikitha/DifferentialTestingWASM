;; Call a function using an invalid index and ensure the WebAssembly implementation throws a specific error message. Test the wizard_engine implementation to detect if it handles or misbehaves without specific error handling for the invalid index.

(assert_invalid
  (module
    (func (call 10))
  )
  "unknown function"
)