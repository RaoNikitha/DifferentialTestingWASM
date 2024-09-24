;; 6. A `loop` that conditionally increments a counter and exits with `br_if` based on the counter value. Introduce `nop` after the counter increment to ensure it does not alter the stack's state causing an unintended infinite loop.

(assert_invalid
  (module
    (func $test-loop (param i32) (result i32)
      (local i32)
      (local.set 1 (local.get 0))
      (loop $label
        (nop)
        (local.set 1 (i32.add (local.get 1) (i32.const 1)))
        (br_if $label (i32.lt_s (local.get 1) (i32.const 10))))
      (local.get 1)))
  "type mismatch"
)