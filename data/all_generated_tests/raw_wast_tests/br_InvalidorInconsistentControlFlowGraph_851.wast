;; 2. **Test Description:** Implement a `loop` inside a `block`, and place several `br` instructions targeting the outer block. Specifically, check if the `br` inside the loop correctly breaks all the way out to the block, ensuring the CFG correctly handles back and forth label jumps. This will test if any unstructured jumps are unintentionally allowed.

(assert_invalid
  (module
    (func $test
      (block $outer
        (loop
          (br $outer)
        )
        (unreachable)
      )
    )
  )
  "inline stack error"
)