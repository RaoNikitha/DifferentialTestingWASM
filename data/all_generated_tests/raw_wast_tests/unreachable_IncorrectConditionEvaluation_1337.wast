;; Develop a loop containing a complex expression within a `br_if` condition, followed by `unreachable`. Validate that varying conditions still lead to traps without incorrect evaluations.

(assert_invalid
  (module
    (func $test-unreachable-in-br_if
      (loop
        (br_if 0
          (i32.eq
            (i32.const 1)
            (i32.const 2)
          )
        )
        unreachable
      )
    )
  )
  "type mismatch"
)