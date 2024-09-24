;; 3. Use an `if` block that contains a `nop` followed by a `br_if` with a true condition. Observe if wizard_engine traces disrupt execution flow causing incorrect branching.

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (then
          (nop)
          (br_if 0 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)