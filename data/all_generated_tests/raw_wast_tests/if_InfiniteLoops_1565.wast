;; 6. **Test Description**:    Using `br_if` in conjunction with `if` inside a loop to conditionally perform an infinite loop:    - Checks how branching within an `if` context relates to continuous loop execution.

(assert_invalid
  (module
    (func $br_if_in_if_loop
      (loop $loop
        (if (i32.const 1)
          (then
            (br_if 0 (i32.const 1))
          )
        )
        (br $loop)
      )
    )
  )
  "type mismatch"
)