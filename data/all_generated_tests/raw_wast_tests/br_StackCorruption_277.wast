;; 8. **Test for Structured Control Violation:**    - Implement a scenario that could potentially violate well-structured control flow and observe if either implementation allows or correctly prevents such illegal branches.

(assert_invalid
  (module
    (func $structured-control-violation
      (block
        (loop
          (br 3)
        )
      )
    )
  )
  "unknown label"
)