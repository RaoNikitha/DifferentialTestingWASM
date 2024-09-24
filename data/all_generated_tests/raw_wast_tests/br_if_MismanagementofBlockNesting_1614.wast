;; 5. **Test Two Sequential br_if in Nested Loop and If Block**:     Construct an `if` block within a loop and use `br_if` instructions sequentially with conditions to exit both blocks correctly. This checks whether the implementation correctly unwinds the stack and refers to appropriate blocks.

(assert_invalid
  (module
    (func $test_nested_br_if
      (loop (result i32)
        (block (result i32)
          (i32.const 1) (i32.const 0)
          (if (result i32)
            (then (br_if 0 (i32.const 0)))
            (else (br_if 1 (i32.const 1)))
          )
        )
      )
    )
  )
  "type mismatch"
)