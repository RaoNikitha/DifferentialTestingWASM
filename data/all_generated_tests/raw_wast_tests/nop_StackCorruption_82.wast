;; 3. Nesting `nop` instructions within a control flow structure such as a `loop` or `if` statement to check that entry and exit stack states for the control structure are identical, highlighting any stack mismanagement due to `nop`.

(assert_invalid
  (module (func $test (block (loop (nop) (br 1)))))
  "type mismatch"
)