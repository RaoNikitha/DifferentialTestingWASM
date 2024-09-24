;; 9. Combine `unreachable` within a deeply nested block where conditionals (`br_if`) are present at multiple levels. Check that `unreachable` traps immediately and all `br_if` conditions where relevant evaluate correctly.

(assert_invalid
  (module
    (func $deeply_nested_unreachable_in_br_if
      (block
        (block
          (block
            (unreachable)
            (br_if 1 (i32.const 1))
          )
          (br_if 1 (i32.const 0))
        )
        (br_if 1 (i32.const 0))
      )
    )
  )
  "type mismatch on br_if"
)