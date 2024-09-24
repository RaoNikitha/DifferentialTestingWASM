;; 7. Utilize a `block` type with an incorrect result type and a nested `loop` with branching to check wizard_engine's failure in type validation leading to an infinite loop.

(assert_invalid
  (module (func $test_infinite_loop
    (block (result f32)
      (loop (result f32)
        (br 1)
      )
    )
  ))
  "type mismatch"
)