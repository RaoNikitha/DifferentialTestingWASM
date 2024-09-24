;; Test 1: Create a loop that expects a specific type on the stack but receives a different type due to previous instructions. This tests if type constraints inside the loop are correctly enforced.

(assert_invalid
  (module (func $type-mismatch-in-loop
    (i32.const 42) (loop (param f32) (drop))
  ))
  "type mismatch"
)