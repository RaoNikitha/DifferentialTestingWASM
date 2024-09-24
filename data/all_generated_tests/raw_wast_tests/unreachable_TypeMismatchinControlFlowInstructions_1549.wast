;; 10. Use `try-catch` with `unreachable` inside the `try` block, followed by a mismatching type operation like `i32.add` inside the catch, to assess how type constraints work with error-handling mechanisms.

(assert_invalid
  (module 
    (func $type-try-catch-mismatch-after-unreachable
      (try
        (do (unreachable))
        (catch (i32.add (i32.const 1) (i32.const 2)))
      )
    )
  )
  "type mismatch"
)