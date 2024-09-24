;; 1. Test a function containing a `loop` and place `unreachable` at the entry of the loop's body. Check if the execution leads to an immediate trap without entering the loop body to verify stack-polymorphism handling.

(assert_invalid
  (module (func $loop_at_entry_unreachable
    (loop (unreachable) (br 0))
  ))
  "type mismatch"
)