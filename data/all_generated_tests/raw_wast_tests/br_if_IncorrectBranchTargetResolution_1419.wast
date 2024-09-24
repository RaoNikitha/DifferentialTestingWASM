;; 10. **Test Description**: Develop a scenario incorporating a `block` within a `loop` and another parent `block`. Insert a `br_if` in the initial block with label `2` to break into the parent `block` and not the inner loop. Verify proper branch target resolution.

(assert_invalid
  (module
    (func $test
      (block
        (loop
          (block
            (br_if 2 (i32.const 1))
          )
        )
      )
    )
  )
  "unknown label"
)