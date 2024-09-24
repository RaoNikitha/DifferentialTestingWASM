;; 5. Embed a `nop` statement in the `then` branch of a conditional instruction (`if`) and follow it with a `br_if` checking the same condition. Ensure WebAssembly handles this without issues; check for wizard_engine debug-related branching errors.

(assert_invalid
  (module
    (func $test_if (param i32)
      (if (local.get 0)
        (then (nop))
        (else (nop)))
      (br_if 0 (local.get 0))))
  "type mismatch"
)