;; 3. **Test Incorrect Context Extension**: A nested loop where the outer loop should terminate based on the inner loop’s condition. This tests whether the context is extended correctly such that control flow exits properly without infinite looping.

(assert_invalid
  (module
    (func $test-loop
      (loop (param i32)
        (if (i32.eqz (local.get 0))
          (br 1))
        (loop (param i32)
          (br_if 1 (i32.eqz (local.get 0)))
        )
      )
    )
  )
  "type mismatch"
)