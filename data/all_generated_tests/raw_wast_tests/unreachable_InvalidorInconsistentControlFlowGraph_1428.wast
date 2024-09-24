;; Test 9: Utilize `unreachable` within a `try`/`catch` block to observe if the trap behaves differently under exception handling mechanisms or exits the try construct properly.

(assert_invalid
  (module
    (func $test-try-catch-unreachable-trap
      (try
        (do
          (unreachable)
        )
        (catch)
      )
    )
  )
  "type mismatch"
)