;; 4. Place an `unreachable` in the middle of multiple nested conditional blocks interleaved with `loop` and `block` instructions, followed by operations that check the stack integrity, ensuring no other instructions after `unreachable` execute.

(assert_invalid
  (module (func
    (block (loop (block (br 2) (unreachable))))
    (i32.const 1) (drop)
  ))
  "type mismatch"
)