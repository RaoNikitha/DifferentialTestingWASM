;; Design a function where `nop` instructions precede a series of conditionals with `br_if`, and validate if the final conditional check handles branching as expected.

(assert_invalid
  (module
    (func $conditional-br_if
      (block
        (nop)
        (br_if 0 (i32.const 1))
        (nop)
      )
    )
  )
  "type mismatch"
)