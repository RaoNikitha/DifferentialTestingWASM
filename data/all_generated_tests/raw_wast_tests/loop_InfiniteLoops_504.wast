;; 5. Craft a loop with balanced pushes and pops ensuring mismanagement of operand stack in a way that incorrectly satisfies the loop continuation condition, resulting in an infinite loop.

(assert_invalid
  (module (func $infinite-loop (loop (block (br 1)) (end))))
  "type mismatch"
)