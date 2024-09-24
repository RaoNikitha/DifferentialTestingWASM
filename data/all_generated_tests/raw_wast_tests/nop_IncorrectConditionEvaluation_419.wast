;; 10. Put `nop` within a handler for multiple `br_if` conditions in a control flow segment. Validate appropriate branching according to conditions, ensuring `nop` does not disrupt correct conditional branching paths.

(assert_invalid
  (module
    (func $test
      block
        i32.const 1
        br_if 0
        nop
        i32.const 0
        br_if 0
      end
    )
  )
  "type mismatch"
)