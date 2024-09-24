;; 3. Design a test where an `if` statement contains nested `block` and `loop` instructions, with a `br` targeting the `if` block from within the innermost block. This assesses whether the implementation can exit the `if` block correctly.

(assert_invalid
  (module
    (func $test
      (if 
        (i32.const 1)
        (then
          (block
            (loop
              (block
                (br 1)
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)