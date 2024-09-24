;; 2. **Test Description 2**:    - Create a `loop` block with multiple `br_if` instructions that branch based on different stack values manipulated inside the loop. Verify condition evaluation by modifying the stack, ensuring branches occur only if specified conditions are true.

(assert_invalid
  (module
    (func $cond-branch-loop (param i32) (result i32)
      (local i32)
      (loop (result i32)
        (local.set 1 (i32.add (local.get 0) (i32.const 1)))
        (br_if 0 (i32.lt_s (local.get 1) (i32.const 5)))
        (local.get 1)
      )
    )
  )
  "type mismatch"
)