;; 9. Integrate `unreachable` within an `else` block of an `if-else` structure, with the `if` branch containing a `br` to an external label. Verify if the trap still interrupts the control flow, preventing the branched instructions from executing.

(assert_invalid
  (module (func $unreachable-in-if-else (block $exit (if (i32.const 1) (br $exit) (else (unreachable)) (i32.const 2))))
  )
  "type mismatch"
)