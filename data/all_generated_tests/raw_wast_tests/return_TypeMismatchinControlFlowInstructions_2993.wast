;; A function contains a loop that returns a string instead of the expected integer, to examine how stack unwinding manages type consistency through incorrect forward branching.

(assert_invalid
  (module
    (func $incorrect-return-type (result i32)
      (loop (return))
      (i32.const 0)
    )
  )
  "type mismatch"
)