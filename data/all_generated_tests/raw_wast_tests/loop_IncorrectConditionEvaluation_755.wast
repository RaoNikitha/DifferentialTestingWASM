;; 6. Write a loop with a `br_if` that depends on a local variable initialized to a non-zero value and decremented inside the loop. The condition should branch when the variable reaches zero. This will test if `br_if` conditions that involve decrementing operations are accurately evaluated.

(assert_invalid
  (module
    (func $br_if_with_decrement
      (local i32)
      (i32.const 5)
      (local.set 0)
      (loop (result i32)
        (local.get 0)
        (br_if 1 (i32.eqz))
        (local.get 0)
        (i32.const 1)
        (i32.sub)
        (local.set 0)
        (br 0)
      )
    )
  )
  "type mismatch"
)