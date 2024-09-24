;; Call a function with insufficient arguments on the stack and confirm that the WebAssembly implementation throws an error for argument mismatch, validating the proper argument handling. Check if the wizard_engine could potentially improperly execute or skip error handling.

(assert_invalid
  (module
    (func $insufficient-args (call 0 (i32.const 42)))
    (func (param i32 i32))
  )
  "type mismatch"
)