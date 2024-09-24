;; 6. Design a stack manipulation in a loop that relies on popping valid function indices for calls. Test what happens when all indices become invalid—WebAssembly should trap, and `wizard_engine` should show infinite loop if not handled.

(assert_invalid
  (module
    (func $test-loop-call-invalid-index
      (loop
        (call 3)
        (br 0)
      )
    )
    (func (param i32))
    (func (param i32))
  )
  "unknown function"
)