;; Carry out a call to a function which has a valid index but is defined with a different number of arguments than expected. Validate that WebAssembly throws the appropriate error. Observe if wizard_engine improperly proceeds or halts with minimal diagnostic information.

(assert_invalid
  (module
    (func $mismatch-arity (call 1))
    (func (param i32) (param i32))
  )
  "type mismatch"
)