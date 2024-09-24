;; Place `nop` instructions before, between, and after `call` instructions in an instruction sequence to see if the function calls are executed in the correct order and without any unintended side effects caused by `nop`.

(assert_invalid
  (module
    (func $test 
      (call $dummy)
      (nop)
      (call $dummy)
      (nop)
      (nop)
      (call $dummy)
    )
    (func $dummy)
  )
  "type mismatch"
)