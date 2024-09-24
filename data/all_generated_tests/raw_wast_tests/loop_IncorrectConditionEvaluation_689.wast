;; 10. **Test Description 10**:    - Construct a `loop` with multiple `br_if` instructions that rely on both static conditions and dynamic conditions that change each iteration. This tests the proper branching behavior based on mixed condition evaluations within a single loop body.

(assert_invalid
  (module (func $complex-loop
    (local $flag i32)
    (local.set $flag (i32.const 1))
    (loop (result i32)
      (br_if 0 (local.get $flag)) ;; should branch to loop start if $flag is 1
      (local.set $flag (i32.const 0))
      (br_if 0 (local.get $flag)) ;; should not branch as $flag is now 0
      (i32.const 42)
    )
  ))
  "type mismatch"
)