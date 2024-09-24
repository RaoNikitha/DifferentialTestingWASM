;; 2. Create a loop that increments a counter and use `unreachable` after a `br_if` that should break the loop under certain conditions. Ensure the loop terminates correctly or causes a trap upon hitting the `unreachable`.

(assert_invalid
  (module (func $invalid-loop-unreachable (result i32)
    (i32.const 0)
    (loop (i32.const 1)
      (br_if 1 (i32.const 0)) 
      (unreachable)
    )
    (i32.add)
  ))
  "type mismatch"
)