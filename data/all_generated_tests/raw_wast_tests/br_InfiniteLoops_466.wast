;; - **Test 7:**    A deeply nested control structure with multiple `block`, `loop` and `if` constructs, where a `br` inside a loop mistakenly targets a non-nested label, causing the loop to be incorrectly referenced and iterated upon infinitely.

(assert_invalid
  (module
    (func $deeply-nested-br-loop
      (block
        (loop
          (if (i32.const 1)
            (block
              (br 2)
            )
          )
        )
      )
    )
  )
  "label index out of range"
)