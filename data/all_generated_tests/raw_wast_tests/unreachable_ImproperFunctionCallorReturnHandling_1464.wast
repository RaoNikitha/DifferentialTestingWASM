;; 5. **Test Description:**    - Function with a conditional branch, where one branch leads to `unreachable`, and verify if only that path traps while others execute normally.    - This test examines conditional branching correctness regarding traps caused by `unreachable`.

(assert_invalid
  (module (func
    (block (br_if 0 (i32.const 0)) (unreachable))
    (i32.const 1)
  ))
  "type mismatch"
)