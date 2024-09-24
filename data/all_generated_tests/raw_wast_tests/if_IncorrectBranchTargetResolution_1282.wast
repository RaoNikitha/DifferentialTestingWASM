;; 3. **Test 3: Misresolved Else-Branch Target**    - An `if` block contains instructions that upon execution should jump to an `else` part, but due to incorrect branch resolution, it skips the `else` and targets the outer block.

(assert_invalid
  (module (func $misresolved-else-branch-target
    (block
      (if (i32.const 0)
        (then (br 1))
        (else (i32.const 1))
      )
    )
  ))
  "type mismatch"
)