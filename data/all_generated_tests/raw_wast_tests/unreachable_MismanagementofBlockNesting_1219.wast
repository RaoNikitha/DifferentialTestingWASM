;; 10. A deeply branched setup intermixing `block`, `loop`, and conditionals containing `unreachable`, followed by a short instruction sequence ensuring the correct handling of exception flow without affecting the outer currently running control contexts.

(assert_invalid
  (module (func $deep-branch-unreachable
    (block (loop (if (unreachable) (then)))) (i32.const 1)
  ))
  "type mismatch"
)