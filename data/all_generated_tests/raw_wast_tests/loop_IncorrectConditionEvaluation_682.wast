;; 3. **Test Description 3**:    - Design a nested `loop` with an internal `br_if` that only executes when a flag variable is set. This test ensures the correct condition checks within nested loops, focusing on inner loop termination based on the flag.

(assert_invalid
  (module
    (func $nested_loop_with_br_if
      (local i32)
      (local.set 0 (i32.const 1))
      (loop (block (loop (br_if 1 (local.get 0))) (br 0)))
    )
  )
  "type mismatch"
)