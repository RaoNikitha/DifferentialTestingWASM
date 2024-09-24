;; 4. **Test Description:**    Construct a scenario where multiple `br_if` instructions in succession should only take branches based on actual true conditions, but due to faulty stack state evaluation, branches are taken regardless of conditions reflecting improper popping/stack state.

(assert_invalid
  (module
    (func $multiple-br_if-condition-handling
      (block
        (i32.const 1)
        (br_if 0 (i32.const 0))
        (br_if 0)
      )
    )
  )
  "type mismatch"
)