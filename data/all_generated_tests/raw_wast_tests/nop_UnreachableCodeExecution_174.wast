;; 5. **Test 5**: Position `nop` instructions inside an `if` block followed by `unreachable` outside the block, verifying that the `if` condition does not lead to unintended traps when the `else` condition should naturally bypass the `unreachable`.

(assert_invalid
  (module
    (func (param i32)
      (if (result i32)
        (local.get 0)
        (then (nop) (i32.const 1))
        (else (unreachable))
      )
    )
  )
  "type mismatch"
)