;; 3. Design a test with an `if` instruction conditionally leading to a well-typed loop that uses `br_if`. Ensure the counter is decremented inside the `else` block of the `if` instruction improperly propagated. Expect the validation handling of both paths being inaccurately managed to cause infinite loops.

(assert_invalid
  (module 
    (func $type-loop-break (result i32)
      (local i32)
      (if (result i32) (i32.const 1)
        (then
          (loop (result i32)
            (i32.const 1)
            (br_if 0 (i32.const 0))
            (i32.const 0)
          )
        )
        (else
          (local.set 0 (i32.sub (local.get 0) (i32.const 1)))
        )
      )
    )
  )
  "type mismatch"
)