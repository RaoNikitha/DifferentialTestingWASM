;; 2. **Test Nested Loops with Shared Locals**    - Create a nested loop scenario where inner and outer loops share local variables extensively. Incorporate `local.tee` instructions to verify if the stack maintains correct values without corruption during nested loop transitions.

(assert_invalid
  (module
    (func $nested-loops-with-shared-locals
      (local i32)
      (local.set 0 (i32.const 42))
      (loop (result i32)
        (local.tee 0)
        (i32.const 1)
        (i32.add)
        (br_if 1)
        (loop (result i32)
          (local.get 0)
          (br_if 1)
        )
      )
    )
  )
  "type mismatch"
)