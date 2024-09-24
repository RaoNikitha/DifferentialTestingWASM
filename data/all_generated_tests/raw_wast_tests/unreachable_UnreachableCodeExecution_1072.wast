;; 3. Embed the `unreachable` instruction within a `loop` construct with a conditional break based on a variable, ensuring that the immediate trap is correctly handled when the condition is falsely leading to `unreachable`.

(assert_invalid
  (module (func $test_unreachable_in_loop (result i32)
    (local i32)
    (local.set 0 (i32.const 1))
    (loop
      (if (i32.eqz (local.get 0))
        (then (unreachable))
      )
      (br 0)
    )
    (i32.const 0)
  ))
  "type mismatch"
)