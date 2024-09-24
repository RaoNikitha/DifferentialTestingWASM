;; 1. Create a loop block that conditionally branches out using `br_if`. Use an operand stack that evaluates to false, ensuring `br_if` should not branch. Check if the loop continues executing as expected.

(assert_invalid
  (module (func $conditional-loop
    (i32.const 0) (loop (br_if 0 (i32.const 0)) (i32.const 1) (drop))
  ))
  "type mismatch"
)