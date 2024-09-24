;; 6. Construct a `block` with an inner `loop`, where the loop is designed to end with `unreachable` while altering stack types—test for correct type enforcement as the block exits.

(assert_invalid
  (module (func $block-with-inner-loop-unreachable (result i32)
    (block (result i32)
      (loop (i32.const 42) (unreachable))
      (f64.const 3.14)
    )
  ))
  "type mismatch"
)