;; Return from a function without sufficiently providing the necessary return values on the stack, observing if the WebAssembly implementation correctly throws a stack underflow or return type error. Compare how wizard_engine handles this return scenario.

(assert_invalid
  (module
    (func $return_with_insufficient_stack
      (call 1)  ;; Make a call to function 1 without pushing arguments
    )
    (func (result i32)  ;; Function expects to return an i32 but stack is empty
    )
  )
  "stack underflow"
)