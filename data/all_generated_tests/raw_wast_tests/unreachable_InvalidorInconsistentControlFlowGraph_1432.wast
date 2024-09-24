;; 3. Use `unreachable` within a combination of `block` and `loop` constructs to test if the block exits properly without falling into subsequent loop iterations or instructions.    - **Constraint:** `unreachable` within block and loop constructs should lead to an immediate exit.    - **CFG Check:** Confirm that nested block and loop structures maintain correct control flow integrity with `unreachable`.

(assert_invalid
  (module (func $test-unreachable-block-loop
    (block
      (loop
        (unreachable)
        (br 1)
      )
    )
  ))
  "type mismatch"
)