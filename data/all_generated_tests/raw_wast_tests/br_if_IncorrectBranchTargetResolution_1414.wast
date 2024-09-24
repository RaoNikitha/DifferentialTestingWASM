;; 5. **Test Description**: Construct a test using multiple `loop` constructs. Place a `br_if` in the innermost loop, intended to break a label targeting the second outermost loop (`label 3`), and check if the control properly unwinds to the designated loop.

(assert_invalid
  (module
    (func
      (loop $loop1
        (loop $loop2
          (block $block
            (br_if 3 (i32.const 1))
          )
        )
      )
    )
  )
  "unknown label"
)