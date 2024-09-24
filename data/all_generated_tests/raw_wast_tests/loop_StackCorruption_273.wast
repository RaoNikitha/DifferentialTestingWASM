;; 4. Test a `loop` with multiple `br_if` instructions that conditionally reenter the loop. Ensure that each conditional branch correctly manages the stack state and no corruption occurs after exiting the loop.

(assert_invalid
  (module
    (func $conditional-reenter
      (local i32)
      (i32.const 5)
      (local.set 0)
      (loop $loop (result i32)
        (local.get 0)
        (i32.const 1)
        (i32.sub)
        (local.tee 0)
        (i32.const 0)
        (i32.ge_s)
        (br_if $loop)
        (local.get 0)
      )
    )
  )
  "type mismatch"
)