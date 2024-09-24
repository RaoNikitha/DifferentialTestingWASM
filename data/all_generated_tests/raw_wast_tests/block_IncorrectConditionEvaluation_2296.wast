;; Use a combination of `block` with multiple `br_if` instructions, each targeting different labels based on increasingly deeper conditions. Verify that each `br_if` evaluates conditions accurately, without causing incorrect branches or stack corruptions by skipping labels.

(assert_invalid
  (module
    (func $test-br_if-nested-blocks
      (block (block (block
        (br_if 2 (i32.const 1)) 
        (br_if 1 (i32.const 0))
        (br_if 0 (i32.const 1))
      )))
      (i32.const 0)
    )
  )
  "type mismatch"
)