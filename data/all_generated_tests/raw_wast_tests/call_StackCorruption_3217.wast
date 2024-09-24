;; 6. Use a `call` instruction with valid and invalid mixed indices in a loop to confirm that invalid calls do not corrupt the stack for subsequent valid calls.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (func $valid (type $sig) (param i32))
    (func $test
      (i32.const 1)
      (call 0) ;; valid call
      (i32.const 1)
      (call 2) ;; invalid call
      (i32.const 1)
      (call 0) ;; valid call
    )
  )
  "unknown function"
)