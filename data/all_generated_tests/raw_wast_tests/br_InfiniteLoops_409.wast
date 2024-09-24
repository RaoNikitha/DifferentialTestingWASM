;; 10. Construct a dual `loop` scenario, where an inner and outer loop exist, and use a `br_if` to conditionally exit the inner loop while ensuring control doesn’t incorrectly fall back into the outer loop, avoiding infinite recursion in loop execution.

(assert_invalid
  (module (func $dual-loop
    (loop (block (br_if 0 (i32.const 0)) (loop (br_if 0 (i32.const 1)) (br 1))))
  ))
  "unknown label"
)