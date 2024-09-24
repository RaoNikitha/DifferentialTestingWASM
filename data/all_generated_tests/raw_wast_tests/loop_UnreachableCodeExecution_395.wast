;; - Test Case 6: Create loops with mismatched types in the block type declaration and follow it with an attempt to branch past several nested levels to an `unreachable`. This ensures type consistency is enforced and avoids reaching `unreachable`.

(assert_invalid
  (module
    (func $nested-loop-mismatch
      (loop (result i32)  ; expects i32
        (loop (result f32)  ; expects f32, will cause type mismatch
          (br 1)  ; branch to outer loop
        )
      )
    )
  )
  "type mismatch"
)