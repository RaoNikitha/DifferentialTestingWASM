;; Test 4: Construct a function with a nested structure where `block`, `loop`, and `br_table` instructions are interleaved. Place `return` at the end of one of the nested paths. Ensure the control flow correctly identifies the outermost block to return from, particularly after executing a complex `br_table`.

(assert_invalid
  (module
    (func $nested-return-test
      (block $outer
        (block $inner
          (loop $loop
            (br_table 0 1 2 (i32.const 1))
            (return (i32.const 42))
          )
        )
      )
    )
  )
  "type mismatch"
)