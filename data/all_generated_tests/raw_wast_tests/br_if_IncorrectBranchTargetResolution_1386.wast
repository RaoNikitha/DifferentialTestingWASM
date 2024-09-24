;; 7. Use a `br_if` inside a `loop` that conditionally jumps to an invalid outer label. This checks the handling of incorrect label resolution and stack polymorphism, ensuring error signaling and proper control flow management.

(assert_invalid
  (module
    (func $invalid-label (loop (br_if 1 (i32.const 1))))
  )
  "invalid label"
)