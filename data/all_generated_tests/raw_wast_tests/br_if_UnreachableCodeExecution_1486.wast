;; 7. **Test 7**: Create a complex nesting involving a `loop` within a `block` and multiple `br_if` instructions targeting both block and loop labels. Add an `unreachable` within the loop to check if incorrect label indexing or stack unwinding causes the `unreachable` to be executed.

(assert_invalid
  (module
    (func $complex-nesting (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br_if 2 (i32.const 1))
            (br_if 0 (i32.const 0))
            (br_if 1 (i32.const 1))
            unreachable
          )
        )
      )
    )
  )
  "type mismatch"
)