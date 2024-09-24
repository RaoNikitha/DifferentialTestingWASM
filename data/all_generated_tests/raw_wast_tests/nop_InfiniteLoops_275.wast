;; 6. Test a sequence where `nop` is followed by a `br` instruction in a loop. Verify that `nop` does not alter the `br`'s target, ensuring the loop terminates as expected.

 ;; (module
  (func $test (loop $loop
    nop
    br $loop
  ))
)