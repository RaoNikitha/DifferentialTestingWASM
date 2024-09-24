;; 5. **Loop with Conditional Exit**:    - Implement a `loop` with an internal `br_if` that should only exit the loop when a specific condition (e.g., counter reaching zero) is met. Observe if the loop exits prematurely without the condition being true, indicating incorrect condition evaluation.

(assert_invalid
  (module
    (func $loop-with-conditional-exit
      (local i32)
      (local.set 0 (i32.const 10))
      (loop
        (br_if 1 (i32.eqz (local.get 0)))
        (local.set 0 (i32.sub (local.get 0) (i32.const 1)))
        (br 0)
      )
    )
  )
  "type mismatch"
)