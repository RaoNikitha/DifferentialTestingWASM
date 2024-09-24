;; 8. Construct a loop where `unreachable` is placed after several instructions that manipulate the stack, ensuring that hitting the `unreachable` traps immediately, and the loop doesn’t execute further iterations.

(assert_invalid
  (module (func $loop-with-unreachable
    (block (loop
      (i32.const 1)
      (i32.add)
      (unreachable)
      (br 1)
    ))
  ))
  "type mismatch"
)