;; - Test Description 9: Construct a loop with conditions to branch in case of specific flag patterns (e.g., alternate true/false states). This will verify if the condition checks properly accommodate repeated pattern evaluation without incorrect branching.

(assert_invalid
  (module
    (func $nested-loop-pattern
      (i32.const 1)
      (loop (result i32)
        (i32.const 0)
        (br_if 0)
        (i32.const 1)
        (loop (result i32)
          (i32.const 0)
          (br_if 0)
          (i32.and)
          (br_if 1)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)